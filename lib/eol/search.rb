# frozen_string_literal: true

module Eol
  # Contains search results from the Encyclopedia of Life database.
  class Search
    include Enumerable
    # @return [Integer] the id of the species
    attr_accessor :id
    # @return [String] title of the entry
    attr_accessor :title
    # @return [String] link to article on the EOL homepage
    attr_accessor :link
    # @return [String] classification content
    attr_accessor :content

    def initialize(response)
      self.id = response['id']
      self.title = response['title']
      self.link = response['link']
      self.content = response['content']
    end

    def each
      yield @id
      yield @title
      yield @link
      yield @content
    end
  end
end
