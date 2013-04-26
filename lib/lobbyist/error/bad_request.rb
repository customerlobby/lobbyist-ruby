require 'lobbyist/error/client_error'

module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 400
    class BadRequest < Lobbyist::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end
