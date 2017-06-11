module Eolife
  class SearchByProvider
    attr_accessor :eol_page_id, :eol_page_link

    def initialize(response)
      @eol_page_id = response['eol_page_id']
      @eol_page_link = response['eol_page_link']
    end
  end
end
