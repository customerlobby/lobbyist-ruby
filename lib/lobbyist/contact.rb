module Lobbyist
  class Contact < Lobbyist::Base
    
    attr_accessor :id, :contact_id, :company_id, :first_name, :last_name,
      :phone_daytime, :phone_alt, :email, :address1, :address2,
      :city, :state, :zip, :country, :last_service_date, :notes,
      :wants_emails, :unsubscribe_reason, :unsubscribed_at,
      :exclude_referral_marketing, :exclude_retention_marketing,
      :facebook_like, :facebook_login_review, :twitter_follow,
      :date_added, :auto_review_id,:auto_review_draft_key, :facebook_uid, 
      :facebook_access_token, :facebook_session_key
    
    def self.find(id)
      create_from_response(get("/v1/contacts/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/contacts.json", {'contact' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/contacts/#{id}.json", {'contact' => params}))
    end

    def self.search(params = {})
      create_from_response(get("/v1/contacts/search.json", params))
    end
    
    def self.unsubscribe(params = {})
      create_from_response(put("/v1/contacts/unsubscribe.json", params))
    end
  end
end
