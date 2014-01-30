module Lobbyist
  module V2

    class Authorization < Lobbyist::V2::Base

      def self.scotty(params)
        create_from_response(post("/v2/authorize/scotty.json", params))
      end
    end

  end
end

