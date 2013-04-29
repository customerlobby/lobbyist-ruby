module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 412
    class PreconditionFailed < Lobbyist::Error::ClientError
      HTTP_STATUS_CODE = 412
    end
  end
end
