module Eolife
  # Contains data on a single hierarchy and its internal relationships
  class HierarchyEntries
    # @return [String]
    attr_accessor :source_identifier
    # @return [Integer]
    attr_accessor :parent_name_usage_id
    # @return [Integer]
    attr_accessor :taxon_concept_id
    # @return [String] binomial nomenclature in zoology
    attr_accessor :scientific_name
    # @return [String] a link
    attr_accessor :source
    # @return [Array]
    attr_accessor :name_according_to
    # @return [Array]
    attr_accessor :vernacular_names
    # @return [Array]
    attr_accessor :synonyms
    # @return [Array]
    attr_accessor :ancestors
    # @return [Array]
    attr_accessor :children

    def initialize(response)
      @source_identifier = response['sourceIdentifier']
      @parent_name_usage_id = response['parentNameUsageID']
      @taxon_concept_id = response['taxonConceptID']
      @scientific_name = response['scientificName']
      @source = response['source']
      @name_according_to = response['nameAccordingTo']
      @vernacular_names = response['vernacularNames']
      @synonyms = response['synonyms']
      @ancestors = response['ancestors']
      @children = response['children']
    end
  end
end
