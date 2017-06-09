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
