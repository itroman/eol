# frozen_string_literal: true

module Eolife
  # Contains references to all hierarchies supplied by EOL Content Partners.
  class ProviderHierarchies
    include Enumerable
    # @return [Integer]
    attr_accessor :id
    # @return [String]
    attr_accessor :label

    def initialize(response)
      self.id = response['id']
      self.label = response['label']
    end

    def each
      yield @id
      yield @label
    end
  end
end
