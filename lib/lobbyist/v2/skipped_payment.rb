module Lobbyist
  module V2

    class SkippedPayment < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :admin_user_id, :reason, :source, :transaction_status
      attr_accessor :status, :amount, :transaction_date, :created_at, :updated_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/company_transactions/skip-payments.json", params))
      end

      def self.find(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/company_transactions/active-skip-payment.json", params))
      end
    end
  end
end
