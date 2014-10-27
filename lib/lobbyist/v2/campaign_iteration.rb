module Lobbyist
  module V2

    class CampaignIteration < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :start_date, :end_date, :tracking_start_date, :tracking_end_date
      attr_accessor :status, :sent_count, :revenue_generated, :roi, :amount_spent, :created_at, :updated_at

      def self.list(campaign_id, params = {})
        create_collection_from_response(get("/v2/campaigns/#{campaign_id}/iterations.json", params))
      end

    end

  end
end
