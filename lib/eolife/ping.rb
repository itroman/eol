module Eolife
  class Ping
    attr_accessor :message

    def initialize(response)
      @message = response
    end
  end
end
