module Eolife

  class DataObjects
 
    attr_reader :identifier, :scientificName, :exemplar, :richness_score, :taxonConcepts, :dataObjects
  
    def initialize(response)
      @identifier = response["identifier"]  
      @scientificName = response["scientificName"]
      @exemplar = response["exemplar"]
      @richness_score = response["richness_score"]
      @taxonConcepts = response["taxonConcepts"]
      @dataObjects = response["dataObjects"]
    end

  end
  
end