module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 401
    class Unauthorized < Lobbyist::Error::ClientError
      HTTP_STATUS_CODE = 401
    end
  end
end
