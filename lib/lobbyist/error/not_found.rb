module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 404
    class NotFound < Lobbyist::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end
