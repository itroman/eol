module Eolife
  # Contains all metadata about the object as submitted to EOL by the 
  # contributing content partner. 
  class DataObjects
    # @return [Integer]
    attr_accessor :identifier
    # @return [String] binomial nomenclature in zoology
    attr_accessor :scientific_name
    # @return [Boolean]
    attr_accessor :exemplar
    # @return [Integer] 
    # EOL has developed a 'Richness Score' for taxon pages which provides a 
    # simple summary number for comparing the amount of information available 
    # for different pages.
    # @see http://eol.org/info/521
    attr_accessor :richness_score
    # @return [Array] An Array of Hashes
    attr_accessor :taxon_concepts
    # @return [Array] An Array of Hashes
    attr_accessor :data_objects

    def initialize(response)
      @identifier = response['identifier']
      @scientific_name = response['scientificName']
      @exemplar = response['exemplar']
      @richness_score = response['richness_score']
      @taxon_concepts = response['taxonConcepts']
      @data_objects = response['dataObjects']
    end
  end
end
