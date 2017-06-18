module Eolife
  # Contains the EOL page ID and link for taxon queried.
  class SearchByProvider
    include Enumerable
    # @return [Integer]
    attr_accessor :eol_page_id
    # @return [String]
    attr_accessor :eol_page_link

    def initialize(response)
      self.eol_page_id = response['eol_page_id']
      self.eol_page_link = response['eol_page_link']
    end
    
    def each
      yield @eol_page_id
      yield @eol_page_link
    end
    
  end
end
