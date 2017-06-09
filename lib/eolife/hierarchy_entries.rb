module Eolife
  class HierarchyEntries
    attr_accessor :source_identifier, :parent_name_usage_id, :taxon_concept_id,
                  :scientific_name, :source, :name_according_to,
                  :vernacular_names, :synonyms, :ancestors, :children

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
