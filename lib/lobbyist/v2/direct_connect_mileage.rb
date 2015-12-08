module Lobbyist
  module V2
    class DirectConnectMileage < Lobbyist::V2::Base

      def self.create(params = {})
        create_from_response(post("/v2/direct-connect-mileages.json", params))
      end

    end
  end
end
