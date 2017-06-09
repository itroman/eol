module Eolife
  class ProviderHierarchies
    attr_accessor :id, :label

    def initialize(response)
      @id = response['id']
      @label = response['label']
    end
  end
end
