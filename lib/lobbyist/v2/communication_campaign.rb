module Lobbyist
  module V2

    class CommunicationCampaign < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :name, :description, :cost_per_postcard, :threshold, :approved_credits, :recommended_credits, :minimum_roi, :approved,
        :accelerator, :transaction_grouping_interval, :min_days_between_mailings, :ignore_thirty_day_bucket, :status, :campaign_type,
        :last_run_date, :run_count, :call_to_action_tracking, :include_commercial_customers, :include_customers_in_contract, :services_offered, :logo_filename,
        :monthly_budget, :recommended_budget, :current_balance, :tag_line, :regulatory_info, :email_first_name, :email_last_name, :email, :created_at, :updated_at,
        :mail_delay_offset, :send_followup_email, :send_sample_postcard, :completed, :in_progress, :iterations_count, :response_rate, :filter_id, :frequency_per_year, 
        :target_mail_date, :communications_sent

      def filter
        @filter
      end

      def filter=(attributes)
        @filter = Filter.new(attributes)
      end
      
      def self.list(params = {})
        create_collection_from_response(get("/v2/campaigns.json", params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/campaigns/#{id}.json", params))
      end

      def self.destroy(id, company_id)
        create_from_response(delete("/v2/company_users/#{id}.json", { company_id: company_id }))
      end

      def self.create(company_id, params)
        create_from_response(post("/v2/campaigns.json", {company_id: company_id, communication_campaign: params}))
      end

      def self.update(id, params)
        create_from_response(put("/v2/campaigns/#{id}.json", {communication_campaign: params}))
      end

      def self.destroy(id, company_id)
        create_from_response(delete("/v2/campaigns/#{id}.json", { company_id: company_id }))
      end

      def self.results(id, params = {})
        create_from_response(get("/v2/campaigns/#{id}/results.json", params))
      end

      def self.search(params = {})
        create_from_response(get("/v2/campaigns/search.json", params))
      end

      def self.charge(id, amount)
        create_from_response(post("/v2/campaigns/#{id}/charge.json", {amount: amount}))
      end
    end

  end
end
