module Eolife
  # Contains data on a single hierarchy and its internal relationships
  class HierarchyEntries
    include Enumerable
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
      self.source_identifier = response['sourceIdentifier']
      self.parent_name_usage_id = response['parentNameUsageID']
      self.taxon_concept_id = response['taxonConceptID']
      self.scientific_name = response['scientificName']
      self.source = response['source']
      self.name_according_to = response['nameAccordingTo']
      self.vernacular_names = response['vernacularNames']
      self.synonyms = response['synonyms']
      self.ancestors = response['ancestors']
      self.children = response['children']
    end
    
    def each
      yield @source_identifier
      yield @parent_name_usage_id
      yield @taxon_concept_id
      yield @scientific_name
      yield @source
      yield @name_according_to
      yield @vernacular_names
      yield @synonyms
      yield @ancestors
      yield @children
    end
    
  end
end
