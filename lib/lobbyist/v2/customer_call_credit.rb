module Lobbyist
  module V2

    class CustomerCallCredit < Lobbyist::V2::Base
      attr_accessor :id, :event, :status, :company

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/customer_call_credits.json", params))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/customer_call_credits.json", params))
      end

      def self.destroy(company_id, id)
        create_from_response(delete("/v2/companies/#{company_id}/customer_call_credits/#{id}.json"))
      end
    end

  end
end
