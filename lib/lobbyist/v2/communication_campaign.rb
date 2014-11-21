module Lobbyist
  module V2

    class CommunicationCampaign < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :name, :description, :cost_per_postcard, :monthly_budget, :minimum_roi, 
        :accelerator, :min_days_between_mailings, :ignore_thirty_day_bucket, :status, :campaign_type, 
        :last_run_date, :call_to_action_tracking, :created_at, :updated_at, :completed, :in_process

      def self.list(params = {})
        create_collection_from_response(get("/v2/campaigns.json", params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/campaigns/#{id}.json", params))
      end

      def self.results(id, params = {})
        create_from_response(get("/v2/campaigns/#{id}/results.json", params))
      end
    end

  end
end
