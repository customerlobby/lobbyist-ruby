module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 502
    class BadGateway < Lobbyist::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = "The Customer Lobby Api is down or being upgraded."
    end
  end
end
