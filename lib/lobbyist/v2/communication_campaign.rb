module Lobbyist
  module V2
    class CommunicationCampaign < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :name, :description, :cost_per_postcard
      attr_accessor :approved_credits, :recommended_credits, :approved
      attr_accessor :min_days_between_mailings, :ignore_thirty_day_bucket
      attr_accessor :status, :campaign_type, :last_run_date, :run_count
      attr_accessor :call_to_action_tracking, :include_commercial_customers
      attr_accessor :include_customers_in_contract, :services_offered, :logo_filename
      attr_accessor :monthly_budget, :recommended_budget, :current_balance, :tag_line
      attr_accessor :regulatory_info, :email_first_name, :email_last_name, :email
      attr_accessor :created_at, :updated_at
      attr_accessor :mail_delay_offset, :send_followup_email, :send_sample_postcard
      attr_accessor :completed, :in_progress, :iterations_count, :response_rate
      attr_accessor :filter_id, :communications_sent, :filter_changeable, :status_description
      attr_accessor :algo_metadata, :include_in_results, :paused, :resume_date, :mail_dates

      attr_reader :filter

      def filter=(attributes)
        @filter = Filter.create_response(attributes)
      end

      def self.list(params = {})
        create_collection_from_response(get('/v2/campaigns.json', params))
      end

      def self.list_by_filter(params = {})
        create_collection_from_response(get('/v2/campaigns/list_by_filter.json', params))
      end

      def self.reset_branding_campaign(company_id, params = {})
        create_from_response(put('/v2/campaigns/reset_branding_campaign.json',
                                 company_id:             company_id,
                                 communication_campaign: params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/campaigns/#{id}.json", params))
      end

      def self.create(company_id, params)
        create_from_response(post('/v2/campaigns.json', company_id: company_id, communication_campaign: params))
      end

      def self.create_branding_campaign(company_id, params = {})
        create_from_response(post('/v2/campaigns/create_branding_campaign.json', company_id: company_id, communication_campaign: params))
      end

      def self.update(id, params)
        create_from_response(put("/v2/campaigns/#{id}.json", communication_campaign: params))
      end

      def self.destroy(id, company_id)
        create_from_response(delete("/v2/campaigns/#{id}.json", company_id: company_id))
      end

      def self.results(id, params = {})
        create_from_response(get("/v2/campaigns/#{id}/results.json", params))
      end

      def self.search(params = {})
        create_from_response(get('/v2/campaigns/search.json', params))
      end

      def self.charge(id, params = {})
        create_from_response(post("/v2/campaigns/#{id}/charge.json", params))
      end

      def self.clone(id)
        create_from_response(post("/v2/campaigns/#{id}/clone.json"))
      end
    end
  end
end
