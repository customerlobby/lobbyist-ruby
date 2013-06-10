module Lobbyist
  class Error

    # Raised when Customer Lobby returns a 4xx HTTP status code or there's an error in Faraday
    class ClientError < Lobbyist::Error

      def initialize(response)
        data = MultiJson.load(response)
        super(data['errors'])
      end
      
    end
  end
end
