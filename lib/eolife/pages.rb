module Eolife

  class Pages

    attr_reader :scientificName, :richness_score, :taxonConcepts, :dataObjects
  
    def initialize(response)
      @scientificName = response["scientificName"]
      @richness_score = response["richness_score"]
      @taxonConcepts = response["taxonConcepts"]
      @dataObjects = response["dataObjects"]
    end

  end

end
