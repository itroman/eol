require 'httparty'

class Ping
  include HTTParty

  base_uri 'eol.org/api'
  
  attr_accessor :message
  
  def initialize(response)
    @message = response
  end 
  
  def self.api_status
    response = get('/ping/1.0.json')
      if response["response"].is_a?(Hash)
        Ping.new(response["response"]["message"])
      else
        raise response.response
      end
  end
end

# s = Ping.api_status
# puts s.message
# puts s.class
