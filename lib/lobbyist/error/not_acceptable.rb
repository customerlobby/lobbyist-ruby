require 'lobbyist/error/client_error'

module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 406
    class NotAcceptable < Lobbyist::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end
