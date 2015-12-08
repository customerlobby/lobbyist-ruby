module Lobbyist
  module V2
    class DirectConnectVehicle < Lobbyist::V2::Base

      def self.create(params = {})
        create_from_response(post("/v2/direct-connect-vehicles.json", params))
      end

    end
  end
end
