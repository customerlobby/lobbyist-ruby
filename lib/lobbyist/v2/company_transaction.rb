module Lobbyist
  module V2

    class CompanyTransaction < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :event_type, :event_description, :source
      attr_accessor :status, :status_description, :requiest_id, :reconciliation_id, :reconciled
      attr_accessor :amount, :transaction_date, :created_at, :updated_at
      
      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/company_transactions.json", params))
      end
    
      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/company_transactions.json", {company_transaction: params}))
      end

      def self.generate_receipt(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/company_transactions/generate-receipt.json", params))
      end

    end
  end
end
