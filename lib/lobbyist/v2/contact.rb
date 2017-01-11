module Lobbyist
  module V2
    class Contact < Lobbyist::V2::Base
      include CommunicationPreferencesHelper

      attr_accessor :contact_id, :company_id, :first_name, :last_name, :phone_daytime, :phone_alt
      attr_accessor :email, :address1, :address2, :city, :state, :zip, :country, :last_service_date
      attr_accessor :notes, :wants_emails, :wants_sms, :wants_calls, :wants_direct_mail, :unsubscribe_reason
      attr_accessor :unsubscribed_at, :auto_review_id
      attr_accessor :auto_invite_id, :auto_customer_call_id, :created_at, :updated_at
      attr_accessor :phone_daytime_ext, :phone_alt_ext, :phone_mobile, :external_id, :company_name
      attr_accessor :commercial, :status, :communication_preferences

      def self.find(id)
        create_from_response(get("/v2/contacts/#{id}.json"))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/contacts.json", {'company_id' => company_id, 'contact' => params}))
      end

      def self.update(company_id, id, params = {})
        create_from_response(put("/v2/contacts/#{id}.json", {'company_id' => company_id, 'contact' => params}))
      end
    end

  end
end
