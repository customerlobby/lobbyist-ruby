module Lobbyist
  module V2

    class ProspectIteration < Lobbyist::V2::Base
      attr_accessor :id, :prospect_campaign_id, :tracking_start_date, :tracking_end_date, :status
      attr_accessor :sent_count, :converted_contact_count, :call_records, :response_rate, :transaction_count

      def self.list(campaign_id, params = {})
        create_collection_from_response(get("/v2/prospect_campaigns/#{campaign_id}/prospect_iterations.json", params))
      end

    end
  end
end
