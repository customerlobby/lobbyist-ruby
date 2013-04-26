require 'lobbyist/erro/errorr'

module Lobbyist
  class Error
    # Raised when Lobbyist returns a 5xx HTTP status code
    class ServerError < Lobbyist::Error
      MESSAGE = "Server Error"

      # Create a new error from an HTTP environment
      def self.from_response(response={})
        new(nil, response[:response_headers])
      end

      # Initializes a new ServerError object
      def initialize(message=nil, response_headers={})
        super((message || self.class.const_get(:MESSAGE)), response_headers)
      end

    end
  end
end
