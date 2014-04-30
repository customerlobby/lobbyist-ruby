module Lobbyist
  module V2

    class Company < Lobbyist::V2::Base

      attr_accessor :company_id, :enterprise_id, :workflow_system_id, :account_level_id
      attr_accessor :company_name, :company_description, :address1, :address2, :city, :state
      attr_accessor :zip, :latitude, :longitude, :timezone, :formatted_address, :phone
      attr_accessor :website, :is_active, :abbreviated_name, :creation_date, :signup_admin_id
      attr_accessor :signup_ip_addr, :account_terminated, :termination_date, :activation_code
      attr_accessor :account_class, :promo_id, :average_score, :admin_notes, :customer_call_notes
      attr_accessor :trial_source, :partner_id, :partner_account_id, :last_synd_stat_date
      attr_accessor :last_credit_grant, :sales_status, :date_live, :country, :user_notes
      attr_accessor :enable_referral_marketing, :enable_retention_marketing
      attr_accessor :last_handwritten_review_credit_grant, :sugar_lead_id, :sugar_account_id
      attr_accessor :sugar_opportunity_id, :company_info_changed, :created_at, :updated_at
      attr_accessor :status, :sales_user_id

      def categories
        @categories
      end
      
      def categories=(attributes)
        @categories = []
        attributes.each do |attribute|
          @categories << Category.new(attribute)
        end
      end

      def review_topics
        @review_topics
      end
      
      def review_topics=(attributes)
        @review_topics = []
        attributes.each do |attribute|
          @review_topics << ReviewTopic.new(attribute)
        end
      end

      def private_feedback_topics
        @private_feedback_topics
      end
      
      def private_feedback_topics=(attributes)
        @private_feedback_topics = []
        attributes.each do |attribute|
          @private_feedback_topics << PrivateFeedbackTopic.new(attribute)
        end
      end

      def company_setting
        @company_setting
      end

      def company_setting=(attributes)
        @company_setting = CompanySetting.new(attributes)
      end
      
      def smart_invite_setting
        @smart_invite_setting
      end

      def smart_invite_setting=(attributes)
        @smart_invite_setting = SmartInviteSetting.new(attributes)
      end

      def self.list(params = {})
        create_collection_from_response(get('/v2/companies.json', params))
      end
    
      def self.find(id)
        create_from_response(get("/v2/companies/#{id}.json"))
      end

      def self.direct_connect_summary(id)
        create_from_response(get("/v2/companies/#{id}/direct-connect-summary.json"))
      end
    
      def self.create(company_params = {})
        create_from_response(post("/v2/companies.json", {'company' => company_params}))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/companies/#{id}.json", {'company' => params}))
      end

      def self.terminate(id)
        create_from_response(put("/v2/companies/#{id}/terminate.json", {'company' => {'account_terminated' => 'true', 'is_active' => 'false', 'termination_date' => Time.now.to_s}}))
      end

      def self.reactivate(id)
        create_from_response(put("/v2/companies/#{id}/reactivate.json", {'company' => {'account_terminated' => 'false', 'is_active' => 'true', 'termination_date' => nil}}))
      end

      def self.metrics(id)
        create_from_response(get("/v2/companies/#{id}/metrics.json"))
      end
    
      def self.scotty_info(id)
        create_from_response(get("/v2/companies/#{id}/scotty_info.json"))
      end
    end

  end
end
