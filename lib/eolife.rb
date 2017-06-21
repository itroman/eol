# frozen_string_literal: true

require_relative 'eol/version'
require_relative 'eol/search'
require_relative 'eol/ping'
require_relative 'eol/pages'
require_relative 'eol/collections'
require_relative 'eol/data_objects'
require_relative 'eol/hierarchy_entries'
require_relative 'eol/hierarchies'
require_relative 'eol/provider_hierarchies'
require_relative 'eol/search_by_provider'
require 'httparty'

# The Eol namespace holds all methods and classes that interact with the
# Encyclopedia of Life API.
module Eol
  include HTTParty

  base_uri 'eol.org/api'

  # Pings the EOL API
  #
  # @see http://www.eol.org/api/docs/ping
  # @example
  #   Eol.ping ==> #<Eol::Ping:0x000000027ffcb8 @message="Success">
  # @return [Eol::Ping] Success or failure results
  def self.ping
    response = get('/ping/1.0.json')
    response.code == 200 ? Eol::Ping.new(response['response']['message']) : bad_response(response)
  end

  # Returns one page of results from the EOL API search
  #
  # @see http://www.eol.org/api/docs/search
  # @param [String] query The species you're looking for.
  # @param [Hash] query_options
  # @option query_options [Integer] :page a maximum of 30 results are returned
  #   per page. This parameter allows you to fetch more pages of results if
  #   there are more than 30 matches
  # @option query_options [String] :exact will find taxon pages if the preferred
  #  name or any synonym or common name exactly matches the search term, `true`
  #  or `false`
  # @option query_options [Integer] :filter_by_taxon_concept_id given an EOL
  #   page ID, search results will be limited to members of that taxonomic group
  # @option query_options [Integer] :filter_by_hierarchy_entry_id given a
  #   Hierarchy Entry ID, search results will be limited to members of that
  #   taxonomic group
  # @option query_options [String] :filter_by_string given a search term, an
  #   exact search will be made and that matching page will be used as the
  #   taxonomic group against which to filter search results
  # @option query_options [Integer] :cache_ttl the number of seconds you wish to
  #   have the response cached
  # @example
  #   Eol.search("dendrophylax", 'exact':true) ==> [#<Eol::Search:0x000000023e0a10 @id=37413, @title="Dendrophylax", @link= ...>]
  # @return [Array<Eol::Search>]
  def self.search(query, query_options = {})
    @query = { q: query }.merge!(query_options)
    response = get('/search/1.0.json', query: @query)
    response.code == 200 ? response['results'].map { |item| Eol::Search.new(item) } : bad_response(response)
  end

  # Returns all results from an EOL API search
  #
  # @see http://www.eol.org/api/docs/search
  # @param [String] query The species you're looking for.
  # @note this method does not accept query options, for a more customized search
  #   use Eol.search
  # @example
  #   Eol.search_all("dendrophylax") ==> [#<Eol::Search:0x000000023e0a10 @id=37413, @title="Dendrophylax", @link= ...>]
  # @return (see search)
  def self.search_all(query)
    @query = { q: query }
    response = get('/search/1.0.json', query: @query)
    response.code == 200 ? all_pages(query, response) : bad_response(response)
  end

  # This method takes an EOL page identifier and returns the scientific name for
  # that page, and optionally returns information about common names, media
  # (text, images and videos), and references to the hierarchies which
  # recognize the taxon described on the page.
  #
  # @see http://eol.org/api/docs/pages
  # @param [String] id identifier for node in hierarchies which EOL indexes
  # @param [Hash] query_options
  # @option query_options [Boolean] :batch (False) returns either a batch or not
  # @option query_options [0-75] :images_per_page limits the number of returned
  #   image objects
  # @option query_options [Integer] :images_page (1) images page
  # @option query_options [0-75] :videos_per_page limits the number of returned
  # @option query_options [Integer] :videos_page (1) videos page
  # @option query_options [0-75] :sounds_per_page limits the number of returned
  # @option query_options [Integer] :sounds_page (1) sounds page
  # @option query_options [0-75] :maps_per_page limits the number of returned
  # @option query_options [Integer] :maps_page (1) maps page
  # @option query_options [0-75] :texts_per_page limites the number of returned
  # @option query_options [Integer] :texts_page (1) texts page
  # @option query_options [String] :subjects
  #   'overview' to return the overview text (if exists), a pipe | delimited
  #   list of subject names from the list of EOL accepted subjects (e.g.
  #   TaxonBiology, FossilHistory), or 'all' to get text in any subject.
  #   options at: http://eol.org/info/toc_subjects
  # @option query_options [cc-by, cc-by-nc, cc-by-sa, cc-by-nc-sa, pd [public
  #   domain], na [not applicable], all] :license (all) a pipe | delimited
  #   list of licenses or 'all' to get objects under any license. Licenses
  #   abbreviated cc- are all Creative Commons licenses.
  # @option query_options [Boolean] :details (false) include all metadata for
  #   data objects
  # @option query_options [Boolean] :common_names (false) return all common
  #   names for the page's taxon
  # @option query_options [Boolean] :synonyms (false) return all synonyms for
  #   the page's taxon
  # @option query_options [Boolean] :references (false) return all references
  #   for the page's taxon
  # @option query_options [Boolean] :taxonomy (true) return any taxonomy details
  #   from different taxon hierarchy providers, in an array named
  #   "taxonConcepts"
  # @option query_options [0,1,2,3,4] :vetted (0) If 'vetted' is given a value
  #   of '1', then only trusted content will be returned. If 'vetted' is '2',
  #   then only trusted and unreviewed content will be returned (untrusted
  #   content will not be returned). If 'vetted' is '3', then only unreviewed
  #   content will be returned. If 'vetted' is '4', then only untrusted content
  #   will be returned.The default is to return all content.
  # @option query_options [Integer] :cache_ttl the number of seconds you wish to
  #   have the response cached
  # @option query_options [ms, de, en, es, fr, gl, it, nl, nb, oc, pt-BR, sv,
  #   tl, mk, sr, uk, ar, zh-Hans, zh-Hant, ko] :language (en) provides the
  #   results in the specified language.
  # @example
  #   Eol.pages('1045608', images_per_page: 10, cache_ttl: 30) ==> #<Eol::Pages:0x00000001024058 @scientific_name="Apis mellifera Linnaeus 1758"...>
  # @return <Eol::Pages>
  def self.pages(id, query_options = {})
    @query = { id: id }.merge!(query_options)
    response = get('/pages/1.0.json', query: @query)
    response.code == 200 ? Eol::Pages.new(response) : bad_response(response)
  end

  # Given the identifier for a collection this API will return all metadata
  # about the collection and the items it contains.
  #
  # @see http://eol.org/api/docs/collections
  # @param [Integer] id any integer
  # @param [Hash] query_options
  # @option query_options [Integer] :page (1) fetches page of results
  # @option query_options [0-500] :per_page (50) sets number of results per page
  # @option query_options [articles, collections, communities, images, sounds,
  #   taxa, users, video] :filter filters search results
  # @option query_options [recently_added, oldest, alphabetical,
  #   reverse_alphabetical, richness, rating, sort_field, reverse_sort_field]
  #   :sort_by (recently_added) sorts results
  # @option query_options [String] :sort_field If a sort_field parameter is
  #   included, only collection items whose sort field exactly matches the given
  #   string will be returned
  # @option query_options [Integer] :cache_ttl the number of seconds you wish to
  #   have the response cached
  # @option query_options [ms, de, en, es, fr, gl, it, nl, nb, oc, pt-BR, sv,
  #   tl, mk, sr, uk, ar, zh-Hans, zh-Hant, ko] :language (en) provides the
  #   results in the specified language.
  # @example
  #   Eol.collections('176', sort_by: 'oldest', cache_ttl: 30) ==> #<Eol::Collections:0x0000000147d078 @name="EOL Group on Flickr", @description="This group...>
  # @return <Eol::Collections>
  def self.collections(id, query_options = {})
    @query = { id: id }.merge!(query_options)
    response = get('/collections/1.0.json', query: @query)
    response.code == 200 ? Eol::Collections.new(response) : bad_response(response)
  end

  # Given the identifier for a data object this API will return all metadata
  # about the object as submitted to EOL by the contributing content partner
  #
  # @see http://eol.org/api/docs/data_objects
  # @param [String] id the ID parameter can either be an integer (a DataObject
  #   version ID) or a 16 character GUID which will return the latest version of
  #   that object
  # @param [Hash] query_options
  # @option query_options [Boolean] :taxonomy (true) return any taxonomy details
  #   from different taxon hierarchy providers, in an array named
  #   "taxonConcepts"
  # @option query_options [Integer] :cache_ttl the number of seconds you wish to
  #   have the response cached
  # @opation query_options [ms, de, en, es, fr, gl, it, nl, nb, oc, pt-BR, sv,
  #   tl, mk, sr, uk, ar, zh-Hans, zh-Hant, ko] :language	(en) provides the
  #   results in the specified language
  # @example
  #   Eol.data_objects('30073527', language: 'it', cache_ttl: 30) ==> #<Eol::DataObjects:0x00000000fc75b0 @identifier=1045608...>
  # @return <Eol::DataObjects>
  def self.data_objects(id, query_options = {})
    @query = { id: id }.merge!(query_options)
    response = get('/data_objects/1.0.json', query: @query)
    response.code == 200 ? Eol::DataObjects.new(response) : bad_response(response)
  end

  # Gives access to a single hierarchy and its internal relationships
  #
  # @see http://eol.org/api/docs/hierarchy_entries
  # @param [Integer] id any integer
  # @param [Hash] query_options
  # @option query_options [Boolean] :common_names (false) return all common
  #   names for this taxon
  # @option query_options [Boolean] :synonyms (false) return all synonyms for
  #   this taxon
  # @option query_options [Integer] :cache_ttl the number of seconds you wish to
  #   have the response cached
  # @option query_options [ms, de, en, es, fr, gl, it, nl, nb, oc, pt-BR, sv,
  #   tl, mk, sr, uk, ar, zh-Hans, zh-Hant, ko] :language (en) provides the
  #   results in the specified language
  # @example
  #   Eol.hierarchy_entries('30408282', common_names: true) ==> #<Eol::HierarchyEntries:0x000000015b8c08 @source_identifier="taxon:142651"...>
  # @return <Eol::HierarchyEntries>
  def self.hierarchy_entries(id, query_options = {})
    @query = { id: id }.merge!(query_options)
    response = get('/hierarchy_entries/1.0.json', query: @query)
    response.code == 200 ? Eol::HierarchyEntries.new(response) : bad_response(response)
  end

  # Lists metadata about a hierarchy such as the provider name and source URL,
  # as well as lists all the taxa which are the root taxa of the taxonomic tree
  #
  # @see http://eol.org/api/docs/hierarchies
  # @param [Integer] id any integer
  # @param [Hash] query_options
  # @option query_options [Integer] :cache_ttl the number of seconds you wish to
  #   have the response cached
  # @option query_options [ms, de, en, es, fr, gl, it, nl, nb, oc, pt-BR, sv,
  #   tl, mk, sr, uk, ar, zh-Hans, zh-Hant, ko] :language (en) provides the
  #   results in the specified language
  # @example
  #   Eol.hierarchies('1188', language: 'de', cache_ttl: 30) ==> #<Eol::Hierarchies:0x000000015e7a08 @title="Species 2000 & ITIS Catalogue of Life: April 2013"...>
  # @return <Eol::Hierarchies>
  def self.hierarchies(id, query_options = {})
    @query = { id: id }.merge!(query_options)
    response = get('/hierarchies/1.0.json', query: @query)
    response.code == 200 ? Eol::Hierarchies.new(response) : bad_response(response)
  end

  # This method will return references to all hierarchies supplied by EOL
  # Content Partners. The response will include the label of the hierarchy and
  # the EOL unique ID representing the hierarchy
  #
  # @see http://eol.org/api/docs/provider_hierarchies
  # @example
  #   Eol.provider_hierarchies ==> [#<Eol::ProviderHierarchies:0x000000016080f0 @id=121, @label="AntWeb (Ant Species)">...]
  # @return [Array<Eol::ProviderHierarchies>]
  def self.provider_hierarchies
    response = get('/provider_hierarchies/1.0.json')
    response.code == 200 ? response.map { |item| Eol::ProviderHierarchies.new(item) } : bad_response(response)
  end

  # This method takes an integer or string which is the unique identifier for a
  # taxon from some provider's database, and a hierarchy_id which represents the
  # provider and returns the EOL page ID for that taxon.
  #
  # @see http://eol.org/api/docs/search_by_provider
  # @param [String] id any string
  # @param [Integer] hierarchy_id the ID of the provider's hierarchy you are
  #   searching within.
  # @param [Hash] query_options
  # @option query_options [Boolean] :batch (false) returns either a batch or not
  # @option query_options [Integer] :cache_ttl the number of seconds you wish to
  #   have the response cached
  # @example
  #   Eol.search_by_provider('180542', 903) ==> [#<Eol::SearchByProvider:0x000000022bf3c0 @eol_page_id=328580>, #<Eol::SearchByProvider:0x000000022bf398...>]
  # @return [Array<Eol::SearchByProvider>]
  def self.search_by_provider(id, hierarchy_id, query_options = {})
    @query = { id: id, hierarchy_id: hierarchy_id }.merge!(query_options)
    response = get('/search_by_provider/1.0.json?', query: @query)
    response.code == 200 ? response.map { |item| Eol::SearchByProvider.new(item) } : bad_response(response)
  end

  def self.all_pages(query, response)
    @n = 0
    total = (response['totalResults'] / 30.to_f).ceil
    total.times.collect {
      response = get('/search/1.0.json', query: { q: query, page: (@n += 1) })
      response['results'].map { |item| Eol::Search.new(item) }
    }.flatten
  end

  def self.bad_response(response)
    raise Error, "Error code #{response.code}" if response.class == HTTParty::Response
    raise StandardError, 'Unknown Error'
  end

  private_class_method :all_pages, :bad_response
end
