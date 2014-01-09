module Lobbyist
  class CompanyTransaction < Lobbyist::Base

    attr_accessor :id, :company_id, :event_type, :event_description, :status,
    :reconciliation_id, :amount, :transaction_date, :created_at, :updated_at

    # Special accessor for form processing in accounts.
    attr_accessor :transaction_type
    
    def self.list(params = {})
      create_collection_from_response(get('/v1/company_transactions.json', params))
    end
    
    def self.create(company_id, transaction_params = {})
      create_from_response(post("/v1/company_transactions.json", {'company_id' => company_id, 'company_transaction' => transaction_params}))
    end
  end
end
