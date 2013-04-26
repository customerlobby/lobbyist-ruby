require 'lobbyist/error/client_error'

module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 422
    class UnprocessableEntity < Lobbyist::Error::ClientError
      HTTP_STATUS_CODE = 422
    end
  end
end
