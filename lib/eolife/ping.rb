# frozen_string_literal: true

module Eolife
  # Contains response message indicating API status
  class Ping
    # @return [String] success or failure message
    attr_accessor :message

    def initialize(response)
      self.message = response
    end
  end
end
