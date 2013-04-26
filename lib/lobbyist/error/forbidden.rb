module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 403
    class Forbidden < Lobbyist::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end
