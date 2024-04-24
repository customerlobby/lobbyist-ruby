module Lobbyist
  module V2

    class ProspectCampaign < Lobbyist::V2::Base

      attr_accessor :id, :company_id, :name, :sent_sample_postcard, :approved_credits
      attr_accessor :meta_data, :meta_summary, :start_date, :end_date, :frequency
      attr_accessor :mailing_interval, :status, :category, :channel, :approved, :tracking
      attr_accessor :results, :budget_per_month, :cost_per_prospect, :cost_per_sale, :cost_per_acquisition
      def self.list(params = {})
        create_collection_from_response(get('/v2/prospect_campaigns.json', params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/prospect_campaigns/#{id}.json", params))
      end

      def self.update(id, params)
        create_from_response(put("/v2/prospect_campaigns/#{id}.json", prospect_campaign: params))
      end
    end

  end
end
