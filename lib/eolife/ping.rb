module Eolife
  # Contains response message indicating API status
  class Ping
    # @return [String] success or failure message
    attr_accessor :message

    def initialize(response)
      @message = response
    end
  end
end
