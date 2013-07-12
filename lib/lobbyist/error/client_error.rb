module Lobbyist
  class Error

    # Raised when Customer Lobby returns a 4xx HTTP status code or there's an error in Faraday
    class ClientError < Lobbyist::Error

      def initialize(response, client_message = nil)
        data = MultiJson.load(response)
        super(data['errors'])
        errors << client_message unless client_message == nil
      end
      
    end
  end
end
