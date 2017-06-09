module Eolife
  class DataObjects
    attr_reader :identifier, :scientific_name, :exemplar, :richness_score,
                :taxon_concepts, :data_objects

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
