# frozen_string_literal: true

module Lobbyist
  module V2
    # APIs for sample-contact
    class SampleContact < Lobbyist::V2::Base
      attr_accessor :contact_id, :company_id, :first_name, :last_name, :phone_daytime, :phone_alt
      attr_accessor :email, :address1, :address2, :city, :state, :zip, :country, :last_service_date
      attr_accessor :notes, :wants_emails, :wants_sms, :wants_calls, :wants_direct_mail, :unsubscribe_reason
      attr_accessor :unsubscribed_at, :auto_review_id
      attr_accessor :auto_invite_id, :auto_customer_call_id, :created_at, :updated_at
      attr_accessor :phone_daytime_ext, :phone_alt_ext, :phone_mobile, :external_id, :company_name, :commercial, :status

      def self.find(company_id)
        create_from_response(get("/v2/sample-contact/#{company_id}.json"))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/sample-contact.json",
                                  {'company_id' => company_id, 'contact' => params}))
      end

      def self.update(company_id, params = {})
        create_from_response(put("/v2/sample-contact.json",
                                 {'company_id' => company_id, 'contact' => params}))
      end
    end

  end
end
