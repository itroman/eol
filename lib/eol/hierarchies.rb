# frozen_string_literal: true

module Eol
  # Contains metadata about a hierarchy such as the provider name and source URL,
  # as well as lists all the taxa which are the root taxa of the taxonomic tree
  class Hierarchies
    include Enumerable
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :contributor
    # @return [String]
    attr_accessor :date_submitted
    # @return [String]
    attr_accessor :source
    # @return [Array] An Array of Hashes
    attr_accessor :roots

    def initialize(response)
      self.title = response['title']
      self.contributor = response['contributor']
      self.date_submitted = response['dateSubmitted']
      self.source = response['source']
      self.roots = response['roots']
    end

    def each
      yield @title
      yield @contributor
      yield @date_submitted
      yield @source
      yield @roots
    end
  end
end
