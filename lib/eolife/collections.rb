module Eolife
  # Contains metadata about the collection and the items it contains
  class Collections
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :description
    # @return [String] a hyperlink to the logo
    attr_accessor :logo_url
    # @return [String] created timestamp
    attr_accessor :created
    # @return [String] modified timestamp
    attr_accessor :modified
    # @return [Integer]
    attr_accessor :total_items
    # @return [Array] An Array of Hashes
    attr_accessor :item_types
    # @return [Array] An Array of Hashes
    attr_accessor :collection_items

    def initialize(response)
      @name = response[:name]
      @description = response[:description]
      @logo_url = response[:logo_url]
      @created = response[:created]
      @modified = response[:modified]
      @total_items = response[:total_items]
      @item_types = response[:item_types]
      @collection_items = response[:collection_items]
    end
  end
end
