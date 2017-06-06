require 'httparty'

class Search
  include HTTParty

  base_uri 'eol.org/api'
  
  attr_accessor :id, :title, :link, :content
  
  def initialize(response)
    @id = response["id"]
    @title = response["title"]
    @link = response["link"]
    @content = response["content"]
  end
  
  def self.search(query)
      response = get("/search/#{query}.json")
      if response["results"].is_a?(Array)
        response["results"].map{|item| Search.new(item)}
      else
        raise response.response
      end 
  end
  
end

# puts "What would you like to search for?"
# query = gets.chomp

# s = Search.search(query)
# s.sort_by! { |x| x.id } # sorts so smallest id integer is first
# s.map { |x| puts x.id } # listing of all ids, in above ordering
# s.each { |x| puts x.link} #listing of all links, in above ordering
