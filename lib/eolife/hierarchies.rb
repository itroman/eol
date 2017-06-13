module Eolife
  # Contains metadata about a hierarchy such as the provider name and source URL,
  # as well as lists all the taxa which are the root taxa of the taxonomic tree
  class Hierarchies
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
      @title = response[:title]
      @contributor = response[:contributor]
      @date_submitted = response[:dateSubmitted]
      @source = response[:source]
      @roots = response[:roots]
    end
  end
end
