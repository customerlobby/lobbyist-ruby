module Lobbyist
  module V2
    class Company < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :enterprise_id, :workflow_system_id, :account_level_id
      attr_accessor :company_name, :company_description, :address1, :address2, :city, :state
      attr_accessor :zip, :latitude, :longitude, :timezone, :formatted_address, :phone, :phone_ext
      attr_accessor :website, :logo_filename, :is_active, :abbreviated_name, :freetrial_start_date, :signup_admin_id
      attr_accessor :signup_ip_addr, :account_terminated, :termination_date, :activation_code
      attr_accessor :account_class, :promo_id, :average_score, :admin_notes, :customer_call_notes
      attr_accessor :trial_source, :partner_id, :partner_account_id, :last_synd_stat_date
      attr_accessor :last_credit_grant, :sales_status, :date_live, :country, :user_notes
      attr_accessor :last_handwritten_review_credit_grant
      attr_accessor :company_info_changed, :created_at, :updated_at
      attr_accessor :status, :sales_user_id, :qualifies_for_free_month, :system_of_record
      attr_accessor :direct_connect_status, :account_manager_id
      attr_accessor :split_field_name, :split_field_file, :split_mapping_type, :insights
      attr_accessor :paysimple_id, :paysimple_enabled, :projected_termination_date
      attr_accessor :free_postcard_credits_this_month, :text_unread_count
      attr_accessor :owner, :source_id, :partner_company_id, :tz_abbreviation, :legal_name, :business_registration_number, :business_type

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

      def company_users
        @company_users
      end

      def company_users=(attributes)
        @company_users = []
        attributes.each do |attribute|
          @company_users << CompanyUser.new(attribute)
        end
      end

      def workflow_system_template
        @workflow_system_template
      end

      def workflow_system_template=(attributes)
        @workflow_system_template = WorkflowSystemTemplate.new(attributes)
      end

      def suggestion_topics
        @suggestion_topics
      end

      def suggestion_topics=(attributes)
        @suggestion_topics = []
        attributes.each do |attribute|
          @suggestion_topics << SuggestionTopic.new(attribute)
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

      def twilio_setting
        @twilio_setting
      end

      def twilio_setting=(attributes)
        @twilio_setting = TwilioSetting.new(attributes)
      end

      def setting
        @company_setting
      end

      def setting=(attributes)
        @company_setting = CompanySetting.new(attributes)
      end

      def smart_invite_setting
        @smart_invite_setting
      end

      def review_destinations
        @review_destination
      end

      def company_feature_flags
        @company_feature_flags
      end

      def company_feature_flags=(attributes)
        @company_feature_flags = []
        attributes.each do |attribute|
          @company_feature_flags << CompanyFeatureFlag.new(attribute)
        end
      end

      def review_destination=(attributes)
        @review_destinations = []
        attributes.each do |attribute|
          @review_destinations << ReviewDestination.new(attribute)
        end
      end

      def smart_invite_setting=(attributes)
        @smart_invite_setting = SmartInviteSetting.new(attributes)
      end

      def self.list(params = {})
        create_collection_from_response(get('/v2/companies.json', params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/companies/#{id}.json", params))
      end

      def self.direct_connect_summary(id)
        create_from_response(get("/v2/companies/#{id}/direct-connect-summary.json"))
      end

      def self.monthly_recurring_revenue(id)
        create_from_response(get("/v2/companies/#{id}/monthly-recurring-revenue.json"))
      end

      def self.insights(id)
        create_from_response(get("/v2/companies/#{id}/insights.json"))
      end

      def self.create(company_params = {}, user_params = nil)
        params = { company: company_params }
        params.merge!({ company_user: user_params }) unless user_params.nil?

        create_from_response(post("/v2/companies.json", params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/companies/#{id}.json", { 'company' => params }))
      end

      # disconnect direct connect for a company
      def self.disconnect_direct_connect(id)
        create_from_response(put("/v2/companies/#{id}/disconnect-direct-connect.json"))
      end

      def self.activate(id)
        create_from_response(put("/v2/companies/#{id}/activate.json", { 'company' => { 'is_active' => 'true', 'status' => 'active' } }))
      end

      def self.terminate(id, termination_params)
        create_from_response(put("/v2/companies/#{id}/terminate.json",
                                 { 'company'     => { 'account_terminated' => 'true', 'is_active' => 'false', 'termination_date' => Time.now.to_s },
                                   'termination' => termination_params }))
      end

      def self.pulse_m_terminate(id)
        create_from_response(put("/v2/companies/#{id}/pulse_m_terminate.json"))
      end

      def self.reactivate(id, params={})
        create_from_response(put("/v2/companies/#{id}/reactivate.json", params))
      end

      def self.scotty_info(id)
        create_from_response(get("/v2/companies/#{id}/scotty_info.json"))
      end

      def self.debit(company_id, campaign_iteration_id, amount)
        create_from_response(post("/v2/companies/#{company_id}/debit.json", { campaign_iteration_id: campaign_iteration_id, amount: amount }))
      end

      def self.filtered_list(params = {})
        create_collection_from_response(get('/v2/companies/filtered-list.json', params))
      end

      def self.update_splitter_direct_connect(company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/update-splitter-direct-connect.json", params))
      end

      def self.disable_direct_connect_splitting(company_id)
        create_from_response(put("/v2/companies/#{company_id}/disable-direct-connect-splitting.json"))
      end

      def self.download_file(company_id, params = {})
        response = post("/v2/companies/#{company_id}/download-customers-file.json", params)
        create_from_response(response)
      end

      def self.direct_connect_import_counts(company_id)
        create_from_response(get("/v2/companies/#{company_id}/direct-connect-import-counts.json"))
      end

      def self.direct_connect_setting(company_id)
        create_from_response(get("/v2/companies/#{company_id}/direct-connect-setting.json"))
      end

      def self.campaign_results(company_id)
        create_from_response(get("/v2/companies/#{company_id}/campaign-results.json"))
      end

      def self.campaigns_credit_summary(company_id)
        create_from_response(get("/v2/companies/#{company_id}/campaigns-credit-summary.json"))
      end

      def self.purchase_campaign_credits(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/purchase-campaign-credits.json", params))
      end

      def self.text_unread_count(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/text-unread-count.json", params))
      end

      def self.enable_texting(id, params={})
        create_from_response(put("/v2/companies/#{id}/enable-texting.json", params))
      end

      def self.regenerate_demo_data(id, params={})
        create_from_response(put("/v2/companies/#{id}/regenerate-demo-data.json", params))
      end

      def self.reset_demo_data(id, params={})
        create_from_response(put("/v2/companies/#{id}/reset-demo-data.json", params))
      end

      def self.tax_pct(company_id)
        res = get("/v2/companies/#{company_id}/tax-pct.json")
        JSON.parse(res.to_json, object_class: OpenStruct)
      end

      def self.subscription_details(company_id)
        res = get("/v2/companies/#{company_id}/subscription-details.json")
        JSON.parse(res.to_json, object_class: OpenStruct)
      end
    end
  end
end
