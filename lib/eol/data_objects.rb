# frozen_string_literal: true

module Eol
  # Contains all metadata about the object as submitted to EOL by the
  # contributing content partner.
  class DataObjects
    include Enumerable
    # @return [Integer]
    attr_accessor :identifier
    # @return [String] binomial nomenclature in zoology
    attr_accessor :scientific_name
    # @return [FalseClass or TrueClass]
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
      self.identifier = response['identifier']
      self.scientific_name = response['scientificName']
      self.exemplar = response['exemplar']
      self.richness_score = response['richness_score']
      self.taxon_concepts = response['taxonConcepts']
      self.data_objects = response['dataObjects']
    end

    def each
      yield @identifier
      yield @scientific_name
      yield @exemplar
      yield @richness_score
      yield @taxon_concepts
      yield @data_objects
    end
  end
end
