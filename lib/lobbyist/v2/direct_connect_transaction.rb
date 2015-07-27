module Lobbyist
  module V2
    class DirectConnectTransaction < Lobbyist::V2::Base

      def self.create(params = {})
        create_from_response(post("/v2/direct-connect-transactions.json", params))
      end

    end
  end
end
