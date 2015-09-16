module Lobbyist
  module V2
    module Admin
      class CommunicationPiece < Lobbyist::V2::Base
        attr_accessor :id, :customer_first_name, :customer_last_name, :customer_address1, :customer_address2
        attr_accessor :customer_city, :customer_state, :customer_zip, :status

        def self.list(campaign_iteration_id, params = {})
          create_collection_from_response(get("/v2/admin/campaign-iterations/#{campaign_iteration_id}/communication-pieces.json", params))
        end

        def verification_errors
          @verification_errors
        end

        def verification_errors=(attributes)
          unless attributes
            @verification_errors = []
            return
          end

          @verification_errors = attributes.split("\n").from(1).map do |attr|
            attr.from(2)
          end
        end
      end
    end
  end
end
