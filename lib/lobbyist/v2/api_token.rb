module Lobbyist
  module V2

    class ApiToken < Lobbyist::V2::Base
      attr_accessor :id, :token

      def self.generate_token(params = {})
        get("/v2/generate_token.json", params)
      end
    end
  end
end
