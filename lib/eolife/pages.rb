module Eolife
  class Pages
    attr_accessor :scientific_name, :richness_score, :taxon_concepts,
                  :data_objects

    def initialize(response)
      @scientific_name = response['scientificName']
      @richness_score = response['richness_score']
      @taxon_concepts = response['taxonConcepts']
      @data_objects = response['dataObjects']
    end
  end
end
