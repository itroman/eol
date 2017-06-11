module Eolife
  class Collections
    attr_accessor :name, :description, :logo_url, :created, :modified,
                  :total_items, :item_types, :collection_items

    def initialize(response)
      @name = response['name']
      @description = response['description']
      @logo_url = response['logo_url']
      @created = response['created']
      @modified = response['modified']
      @total_items = response['total_items']
      @item_types = response['item_types']
      @collection_items = response['collection_items']
    end
  end
end
