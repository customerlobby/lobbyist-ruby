module Lobbyist
  module V2

    class CompanySubscription < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :subscription_id, :reference, :authorization_code
      attr_accessor :status, :on_hold_since, :last_four, :expiration_date, :card_type
      attr_accessor :total_payments, :next_payment_date, :last_contacted_at, :created_at, :updated_at
      
      def self.find(company_id)
        create_from_response(get("/v2/companies/#{company_id}/company_subscription.json"))
      end
    
      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/company_subscription.json", params))
      end
    
      def self.update(company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/company_subscription.json", params))
      end

      def self.skip(company_id, company_user_id)
        create_from_response(put("/v2/companies/#{company_id}/company_subscription/skip-payment.json", {'report_retention' => {'company_user_id' => company_user_id}}))
      end

      def self.unskip(company_id)
        create_from_response(put("/v2/companies/#{company_id}/company_subscription/unskip-payment.json"))
      end

    end
    
  end
end
