module Eolife
  class Hierarchies
    attr_accessor :title, :contributor, :date_submitted, :source, :roots

    def initialize(response)
      @title = response['title']
      @contributor = response['contributor']
      @date_submitted = response['dateSubmitted']
      @source = response['source']
      @roots = response['roots']
    end
  end
end
