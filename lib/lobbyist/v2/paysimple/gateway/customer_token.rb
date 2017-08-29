module Lobbyist
  module V2
    module Paysimple
      module Gateway
        class CustomerToken < Lobbyist::V2::Base

          attr_reader :jwt_token
          def self.fetch(customer_id)
            create_from_response(get("/v2/paysimple/gateway/customer_token/#{customer_id}.json"))
          end

        end
      end
    end
  end
end
