module Lobbyist
  class Contact < Lobbyist::Base

    attr_accessor :contact_id, :company_id, :first_name, :last_name, :phone_daytime, :phone_alt
    attr_accessor :email, :address1, :address2, :city, :state, :zip, :country, :last_service_date
    attr_accessor :notes, :wants_emails, :wants_sms, :wants_calls, :wants_direct_mail, :unsubscribe_reason
    attr_accessor :unsubscribed_at, :exclude_referral_marketing, :exclude_retention_marketing
    attr_accessor :facebook_like, :facebook_login_review, :twitter_follow, :date_added, :auto_review_id
    attr_accessor :auto_invite_id, :auto_customer_call_id, :auto_review_draft_key, :created_at, :updated_at
    attr_accessor :phone_daytime_ext, :phone_alt_ext, :phone_mobile, :external_id
    
    def self.find(id)
      create_from_response(get("/v1/contacts/#{id}.json"))
    end
    
    def self.create(company_id, params = {})
      create_from_response(post("/v1/contacts.json", {'company_id' => company_id, 'contact' => params}))
    end
    
    def self.update(company_id, id, params = {})
      create_from_response(put("/v1/contacts/#{id}.json", {'company_id' => company_id, 'contact' => params}))
    end

    def self.search(params = {})
      create_from_response(get("/v1/contacts/search.json", params))
    end
    
    def self.unsubscribe(params = {})
      create_from_response(put("/v1/contacts/unsubscribe.json", {'contact' => params}))
    end
    
    def self.insufficient_handwritten_credits(company_id, params = {})
      create_from_response(post("/v1/contacts/insufficient_handwritten_credits.json", {'company_id' => company_id, 'contact' => params}))
    end
    
    def self.transcribe_allowed(params = {})
      create_from_response(get('/v1/contacts/transcribe_allowed.json', params))
    end
  end
end
