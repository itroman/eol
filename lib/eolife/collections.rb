module Eolife
  # Contains metadata about the collection and the items it contains
  class Collections
    include Enumerable
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
      self.name = response['name']
      self.description = response['description']
      self.logo_url = response['logo_url']
      self.created = response['created']
      self.modified = response['modified']
      self.total_items = response['total_items']
      self.item_types = response['item_types']
      self.collection_items = response['collection_items']
    end

    def each
      yield @name
      yield @description
      yield @logo_url
      yield @created
      yield @modified
      yield @total_items
      yield @item_types
      yield @collection_items
    end
  end
end
