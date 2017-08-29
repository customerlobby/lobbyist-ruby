module Lobbyist
  module V2
    class Paysimple < Lobbyist::V2::Base

      attr_accessor :jwt_token, :expiration

      def self.fetch
        post("/v2/paysimples")
      end

    end
  end
end
