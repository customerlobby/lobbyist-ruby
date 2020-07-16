module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 503
    class ProtocolUnsupported < Lobbyist::Error::ServerError
      HTTP_STATUS_CODE = 505
      MESSAGE = "HTTP version not supported"
    end
  end
end
