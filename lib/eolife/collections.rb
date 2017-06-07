require 'httparty'

class Collections
  include HTTParty
  
  base_uri 'eol.org/api'
  
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
  
  def self.get_collections(id, query_options = {})
    response = get("/collections/1.0/#{id}.json?", :query => query_options)
      if response != nil
        Collections.new(response)
      else
        puts response.code
      end 
  end

end

# c = Collections.get_collections(176)

# puts c.name
# puts c.description
# puts c.collection_items
# puts c.collection_items[2]