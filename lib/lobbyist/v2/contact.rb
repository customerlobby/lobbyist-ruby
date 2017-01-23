module Lobbyist
  module V2
    class Contact < Lobbyist::V2::Base

      attr_accessor :contact_id, :company_id, :first_name, :last_name, :phone_daytime, :phone_alt
      attr_accessor :email, :address1, :address2, :city, :state, :zip, :country, :last_service_date
      attr_accessor :notes, :unsubscribe_reason, :unsubscribed_at, :auto_review_id
      attr_accessor :auto_invite_id, :auto_customer_call_id, :created_at, :updated_at
      attr_accessor :phone_daytime_ext, :phone_alt_ext, :phone_mobile, :external_id, :company_name
      attr_accessor :commercial, :status, :communication_preferences
      attr_accessor :wants_email, :wants_call, :wants_sms, :wants_mail
      attr_accessor :dc_wants_email, :dc_wants_call, :dc_wants_sms, :dc_wants_mail
      attr_accessor :member_wants_email, :member_wants_call, :member_wants_sms, :member_wants_mail
      attr_accessor :customer_wants_email, :customer_wants_call, :customer_wants_sms, :customer_wants_mail

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
