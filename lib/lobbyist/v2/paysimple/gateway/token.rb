module Lobbyist
  module V2
    module Paysimple
      module Gateway
        class Token < Lobbyist::V2::Base

          attr_reader :jwt_token, :expiration
          def self.fetch
            create_from_response(post("/v2/paysimple/gateway/token.json"))
          end

        end
      end
    end
  end
end
