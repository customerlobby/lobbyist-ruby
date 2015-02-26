module Lobbyist
  module V2

    class CampaignIteration < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :start_date, :end_date, :tracking_start_date, :tracking_end_date
      attr_accessor :status, :sent_count, :revenue_generated, :roi, :amount_spent, :budget_snapshot, :created_at, :updated_at

      def self.list(campaign_id, params = {})
        create_collection_from_response(get("/v2/campaigns/#{campaign_id}/campaign-iterations.json", params))
      end
    end

    def self.communication_pieces(id, params={})
      response = get("v2/campaign-iterations/#{id}/communication-pieces.json", params)
      create_collection_from_response(response)
    end

  end
end
