module Lobbyist
  class Company < Lobbyist::Base

    attr_accessor :company_id, :enterprise_id, :account_level_id, :company_name, :company_description,
      :address1, :address2, :city, :state, :zip, :latitude, :longitude, :timezone, :formatted_address, :phone, :phone_ext,
      :website,:is_active, :abbreviated_name, :freetrial_start_date, :signup_admin_id, :signup_ip_addr,
      :account_terminated, :termination_date, :activation_code, :account_class, :promo_id,
      :average_score, :admin_notes, :customer_call_notes, :trial_source, :partner_id, :partner_account_id,
      :last_synd_stat_date, :last_credit_grant, :sales_status, :date_live, :country, :user_notes,
      :smart_invite, :last_handwritten_review_credit_grant, :sugar_account_id, :created_at, :updated_at, :status,
      :system_of_record, :category_name, :split_field_name, :split_field_file, :split_mapping_type

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
      attributes.each do |user|
        @company_users << CompanyUser.new(user)
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

    def self.list(params = {})
      create_collection_from_response(get('/v1/companies.json', params))
    end

    def self.find(id)
      create_from_response(get("/v1/companies/#{id}.json"))
    end

    def self.scotty_upload_summary(id)
      create_from_response(get("/v1/companies/#{id}/scotty-upload-summary.json"))
    end

    def self.create(company_params = {}, user_params = {})
      create_from_response(post("/v1/companies.json", {'company' => company_params, 'company_user' => user_params}))
    end

    def self.update(id, params = {})
      create_from_response(put("/v1/companies/#{id}.json", {'company' => params}))
    end

    def self.terminate(id)
      create_from_response(put("/v1/companies/#{id}/terminate.json", {'company' => {'account_terminated' => 'true', 'is_active' => 'false', 'termination_date' => Time.now.to_s}}))
    end

    def self.reactivate(id, params = {})
      create_from_response(put("/v1/companies/#{id}/reactivate.json", params.slice(:billing,:card,:company,:company_id,:account_level_transition)))
    end
  end
end
