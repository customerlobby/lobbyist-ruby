module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 504
    class GatewayTimeout < Lobbyist::Error::ServerError
      HTTP_STATUS_CODE = 504
      MESSAGE = "The Customer Lobby Api servers are up, but the request couldn't be serviced due to some failure within our stack. Try again later."
    end
  end
end
