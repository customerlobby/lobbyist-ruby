module Lobbyist
  module V2
    class DirectConnectContact < Lobbyist::V2::Base

      def self.create(params = {})
        create_from_response(post("/v2/direct-connect-contacts.json", params))
      end

    end
  end
end
