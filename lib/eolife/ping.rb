module Eolife

  class Ping

    attr_accessor :message
  
    def initialize(response)
      @message = response
    end 

  end

end

# s = Ping.api_status
# puts s.message
# puts s.class
