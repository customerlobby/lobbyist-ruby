module Lobbyist
  class CompanySubscription < Lobbyist::Base
    attr_accessor :id, :company_id, :subscription_id, :reference, :authorization_code,
    attr_accessor :status, :on_hold_since, :last_four, :expiration_date, :card_type,
    attr_accessor :last_contacted_at, :created_at, :updated_at
    
    def self.list(params = {})
      create_collection_from_response(get("/v1/company_subscriptions.json", params))
    end

    def self.find_by_company(id)
      create_from_response(get("/v1/company_subscriptions/company/#{id}.json"))
    end
  end
end