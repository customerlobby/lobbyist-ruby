module Lobbyist
  module V2

    class ProspectIteration < Lobbyist::V2::Base
      attr_accessor :id, :prospect_campaign_id, :start_date, :end_date,
                    :tracking_start_date, :tracking_end_date
      attr_accessor :status, :sent_count, :revenue_generated, :amount_spent, :stored_file_status
      attr_accessor :budget_snapshot, :credit_snapshot, :created_at, :updated_at, :filename, :roi

      def self.list(campaign_id, params = {})
        create_collection_from_response(get("/v2/campaigns/#{campaign_id}/campaign-iterations.json", params))
      end

      def self.generate_results_file(id, params={})
        response = post("v2/campaign-iterations/#{id}/generate-file.json", params)
        create_from_response(response)
      end
    end

    def self.communication_pieces(id, params={})
      response = get("v2/campaign-iterations/#{id}/communication-pieces.json", params)
      create_collection_from_response(response)
    end

  end
end
