require 'httparty'

class DataObjects
  include HTTParty

  base_uri 'eol.org/api'
  
  attr_reader :identifier, :scientificName, :exemplar, :richness_score, :taxonConcepts, :dataObjects
  
  def initialize(response)
    @identifier = response["identifier"]  
    @scientificName = response["scientificName"]
    @exemplar = response["exemplar"]
    @richness_score = response["richness_score"]
    @taxonConcepts = response["taxonConcepts"]
    @dataObjects = response["dataObjects"]
  end

  def self.get_data_objects(id)
      response = get("/data_objects/1.0/#{id}.json?")
      if response != nil
        DataObjects.new(response)
      else
        raise response.response
      end 
  end
end