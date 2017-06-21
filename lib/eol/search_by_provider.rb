# frozen_string_literal: true

module Eol
  # Contains the EOL page ID and link for taxon queried.
  class SearchByProvider
    include Enumerable
    # @return [Integer]
    attr_accessor :eol_page_id
    # @return [String]
    attr_accessor :eol_page_link

    def initialize(response)
      self.eol_page_id = response['eol_page_id'] if response['eol_page_id'] != nil
      self.eol_page_link = response['eol_page_link'] if response['eol_page_link'] != nil
    end

    def each
      yield @eol_page_id
      yield @eol_page_link
    end
  end
end
