module Lobbyist
  class Error
    # Raised when Lobbyist returns the HTTP status code 500
    class InternalServerError < Lobbyist::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = "Something is technically wrong."
    end
  end
end
