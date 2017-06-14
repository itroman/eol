module Eolife
  # Contains references to all hierarchies supplied by EOL Content Partners.
  class ProviderHierarchies
    # @return [Integer]
    attr_accessor :id 
    # @return [String]
    attr_accessor :label

    def initialize(response)
      @id = response['id']
      @label = response['label']
    end
  end
end
