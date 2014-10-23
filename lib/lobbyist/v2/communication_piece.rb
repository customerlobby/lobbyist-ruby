module Lobbyist
  module V2

    class CommunicationPiece < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :campaign_iteration_id, :customer_first_name, 
      :customer_last_name, :customer_address1, :customer_address2, :customer_state, 
      :customer_city, :customer_zip,  :uuid, :status, :print_batch_job_id, :tracking_code, 
      :tracking_status, :delivered_at, :created_at, :updated_at

      def self.list(id, params = {})
        create_collection_from_response(get("/v2/iterations/#{id}/communications.json", params = {}))
      end

    end

  end
end
