module Eolife

  class Search

    attr_accessor :id, :title, :link, :content
  
    def initialize(response)
      @id = response["id"]
      @title = response["title"]
      @link = response["link"]
      @content = response["content"]
    end
  
  end

end

# puts "What would you like to search for?"
# query = gets.chomp



#s = Search.search("tolumnia", "exact=true")
#puts s[0].class
#s.sort_by! { |x| x.id } # sorts so smallest id integer is first
#s.map { |x| puts x.id } # listing of all ids, in above ordering
# s.each { |x| puts x.link} #listing of all links, in above ordering
