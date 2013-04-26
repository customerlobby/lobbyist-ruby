module Lobbyist
  class Error
    # Raised when Customer Lobby returns the HTTP status code 503
    class ServiceUnavailable < Lobbyist::Error::ServerError
      HTTP_STATUS_CODE = 503
      MESSAGE = "Customer Lobby is over capacity."
    end
  end
end
