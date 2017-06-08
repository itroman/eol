module Eolife

  class Hierarchies
  
    attr_accessor :title, :contributor, :dateSubmitted, :source, :roots
    
    def initialize(response)
      @title = response["title"]
      @contributor = response["contributor"]
      @dateSubmitted = response["dateSubmitted"]
      @source = response["source"]
      @roots = response["roots"]
    end 
    
  end

end 
