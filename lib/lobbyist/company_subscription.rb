module Lobbyist
  class CompanySubscription < Lobbyist::Base
    attr_accessor :id, :company_id, :subscription_id, :reference, :authorization_code
    attr_accessor :status, :on_hold_since, :last_four, :expiration_date, :card_type
    attr_accessor :total_payments, :last_contacted_at, :next_payment_date, :created_at, :updated_at
    attr_accessor :monthly_fee, :setup_fee, :cost_per_postcard, :customer_count_lower_bound, :customer_count_upper_bound, :add_ons, :email_add_ons, :prospect_add_ons
    
    def self.list(params = {})
      create_collection_from_response(get("/v1/company_subscriptions.json", params))
    end

    def self.find(id, params = {})
      create_from_response(get("/v1/company_subscriptions/#{id}.json", params))
    end
    
    def self.create(company_id, params = {})
      create_from_response(post("/v1/company_subscriptions.json", params.slice(:billing,:card,:company,:company_id,:account_level_transition).merge(company_subscription: {company_id: company_id})))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/company_subscriptions/#{id}.json", company_subscription: params))
    end

    def self.update_billing(id, company_id, params = {})
      create_from_response(put("/v1/company_subscriptions/#{id}/update_billing.json",
                               params.slice(:billing,:card,:company,:company_id,:account_level_transition, :pulse_m_subscription).merge(company_subscription: {company_id: company_id})))
    end
    
    def self.skip(company_id)
      create_from_response(put("/v1/company_subscriptions/skip-payment.json", company_subscription: {company_id: company_id}))
    end
    
    def self.unskip(company_id)
      create_from_response(put("/v1/company_subscriptions/unskip-payment.json", company_subscription: {company_id: company_id}))
    end
    
    def self.find_by_company_id(id)
      create_from_response(get("/v1/companies/#{id}/subscription.json"))
    end
  end
end
