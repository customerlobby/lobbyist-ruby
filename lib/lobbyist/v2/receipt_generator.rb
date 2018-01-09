module Lobbyist
  module V2

    class ReceiptGenerator < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :status, :receipt_url, :date

      def self.receipts(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/receipts.json", params))
      end
    end
  end
end