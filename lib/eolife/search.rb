module Eolife
  # Contains search results from the Encyclopedia of Life database.
  class Search
    # @return [Integer] the id of the species
    attr_accessor :id
    # @return [String] title of the entry
    attr_accessor :title
    # @return [String] link to article on the EOL homepage
    attr_accessor :link
    # @return [String] classification content
    attr_accessor :content

    def initialize(response)
      @id = response['id']
      @title = response['title']
      @link = response['link']
      @content = response['content']
    end
  end
end
