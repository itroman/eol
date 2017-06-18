module Eolife
  # Contains returns the scientific name for that page, and optionally contains 
  # information about common names, media (text, images and videos), 
  # and references to the hierarchies which recognize the taxon described on 
  # the page.
  class Pages
    include Enumerable
    # @return [String] binomial nomenclature in zoology
    attr_accessor :scientific_name
    # @return [Integer] 
    # EOL has developed a 'Richness Score' for taxon pages which provides a 
    # simple summary number for comparing the amount of information available 
    # for different pages.
    # @see http://eol.org/info/521
    attr_accessor :richness_score
    # @return [Array] an Array of Hashes
    attr_accessor :taxon_concepts
    # @return [Array] an Array of Hashes
    attr_accessor :data_objects

    def initialize(response)
      self.scientific_name = response['scientificName']
      self.richness_score = response['richness_score']
      self.taxon_concepts = response['taxonConcepts']
      self.data_objects = response['dataObjects']
    end
    
    def each
      yield @scientific_name
      yield @richness_score
      yield @taxon_concepts
      yield @data_objects
    end
    
  end
end
