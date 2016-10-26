module Lobbyist
  module V2
    class DirectConnectServiceContract < Lobbyist::V2::Base

      def self.create(params = {})
        create_from_response(post("/v2/direct-connect-service-contracts.json", params))
      end

    end
  end
end
