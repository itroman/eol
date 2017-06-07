require 'httparty'

class Pages
  include HTTParty

  base_uri 'eol.org/api'
  
  attr_reader :scientificName, :richness_score, :taxonConcepts, :dataObjects
  
  def initialize(response)
    @scientificName = response["scientificName"]
    @richness_score = response["richness_score"]
    @taxonConcepts = response["taxonConcepts"]
    @dataObjects = response["dataObjects"]
  end

  def self.get_pages(id)
      response = get("/pages/1.0.json?batch=false&id=#{id}")
      if response != nil
        Pages.new(response)
      else
        raise response.response
      end 
  end
end

p = Pages.get_pages('1045608')
# puts p.scientificName
# puts p.richness_score
# puts p.taxonConcepts[0]["taxonRank"]
# puts p.dataObjects[0]