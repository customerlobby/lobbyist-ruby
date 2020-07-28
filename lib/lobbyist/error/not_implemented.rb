module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 503
    class NotImplemented < Lobbyist::Error::ServerError
      HTTP_STATUS_CODE = 501
      MESSAGE = "The service you requested is not provided by customerlobby currently"
    end
  end
end
