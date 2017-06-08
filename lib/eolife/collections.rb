module Eolife

  class Collections
  
    attr_reader :name, :description, :logo_url, :created, :modified, :total_items, :item_types, :collection_items
  
    def initialize(response)
      @name = response["name"]
      @description = response["description"]
      @logo_url = response["logo_url"]
      @created = response["created"]
      @modified = response["modified"]
      @total_items = response["total_items"]
      @item_types = response["item_types"]
      @collection_items = response["collection_items"]
    end

  end

end

# c = Collections.get_collections(176)

# puts c.name
# puts c.description
# puts c.collection_items
# puts c.collection_items[2]