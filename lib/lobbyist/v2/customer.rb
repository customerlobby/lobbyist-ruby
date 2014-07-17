module Lobbyist
  module V2

    class Customer < Lobbyist::V2::Base
      attr_accessor :contact_id, :company_id, :first_name, :last_name, :phone_daytime, :phone_alt
      attr_accessor :email, :address1, :address2, :city, :state, :zip, :country, :last_service_date
      attr_accessor :notes, :wants_emails, :wants_sms, :wants_calls, :wants_direct_mail, :unsubscribe_reason
      attr_accessor :unsubscribed_at, :exclude_referral_marketing, :exclude_retention_marketing
      attr_accessor :facebook_like, :facebook_login_review, :twitter_follow, :auto_review_id
      attr_accessor :auto_invite_id, :auto_customer_call_id, :auto_review_draft_key, :facebook_uid
      attr_accessor :facebook_access_token, :facebook_session_key, :created_at, :updated_at
      attr_accessor :phone_daytime_ext, :phone_alt_ext, :phone_mobile, :external_id, :company_name, :commercial, :status

      def self.find(id, company_id)
        create_from_response(get("/v2/companies/#{company_id}/customers/#{id}.json"))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/customers.json", {'contact' => params}))
      end

      def self.update(id, company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/customers/#{id}.json", {'contact' => params}))
      end

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/customers.json", params))
      end
    end

  end
end
