module Eolife

  class HierarchyEntries
    
    attr_accessor :sourceIdentifier, :parentNameUsageID, :taxonConceptID, 
                  :scientificName, :source, :nameAccordingTo, :vernacularNames, 
                  :synonyms, :ancestors, :children
                  
    def initialize(response)
      @sourceIdentifier = response['sourceIdentifier']
      @parentNameUsageID = response['parentNameUsageID']
      @taxonConceptID = response['taxonConceptID']
      @scientificName = response['scientificName']
      @source = response["source"]
      @nameAccordingTo = response["nameAccordingTo"]
      @vernacularNames = response["vernacularNames"]
      @synonyms = response["synonyms"]
      @ancestors = response["ancestors"]
      @children = response["children"]
    end
  
  end
  
end
