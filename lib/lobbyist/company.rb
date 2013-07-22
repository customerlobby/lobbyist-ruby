module Lobbyist
  class Company < Lobbyist::Base

    attr_accessor :company_id, :enterprise_id, :account_level_id, :company_name, :company_description,
      :address1, :address2, :city, :state, :zip, :latitude, :longitude, :formatted_address, :phone,
      :website,:is_active, :abbreviated_name, :creation_date, :signup_admin_id, :signup_ip_addr,
      :account_terminated, :termination_date, :activation_code, :account_class, :promo_id, :average_changed,
      :average_score, :admin_notes, :customer_call_notes, :trial_source, :partner_id, :partner_account_id,
      :syndicate, :last_synd_stat_date, :last_credit_grant, :send_transaction_receipts, :send_transaction_receipts_to,
      :sales_status, :date_live, :country, :user_notes, :smart_invite, :enable_referral_marketing, :enable_retention_marketing,
      :rss_queue_push, :rss_queue_attempts, :rss_change_date, :rss_push_date, :feedburner_url, :last_handwritten_review_credit_grant,
      :api_user_name, :api_key_hash, :sugar_lead_id, :sugar_account_id, :sugar_opportunity_id, :company_info_changed,
      :created_at, :updated_at, :status

    def setting
      @setting
    end

    def setting=(attributes)
      @setting = CompanySetting.new(attributes)
    end
      
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

    def suggestion_topics
      @suggestion_topics
    end

    def suggestion_topics=(attributes)
      @suggestion_topics = []
      attributes.each do |suggestion|
        @suggestion_topics << SuggestionTopic.new(suggestion)
      end
    end

    def company_users
      @company_users
    end

    def company_users=(attributes)
      @company_users = []
      attributes.each do |suggestion|
        @company_users << CompanyUser.new(suggestion)
      end
    end
    
    def smart_invite_setting
      @smart_invite_setting
    end
    
    def smart_invite_setting=(attributes)
      @smart_invite_setting = SmartInviteSetting.new(attributes)
    end
    
    def reviews_count
      @reviews_count
    end

    def reviews_count=(attributes)
      @reviews_count = ReviewsCount.new(attributes)
    end

    def self.find(id)
      create_from_response(get("/v1/companies/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/companies.json", {'company' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/companies/#{id}.json", {'company' => params}))
    end
  end
end
