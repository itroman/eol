module Eolife
  class Ping
    # @return [String] success or failure message
    attr_accessor :message

    def initialize(response)
      @message = response
    end
  end
end
