module Lobbyist
  module V2
    class OverbudgetCompany < Lobbyist::V2::Base
      attr_accessor :company_id, :company_name, :account_class, :status
      attr_accessor :approved_credits, :recommended_credits

      def self.list
        create_collection_from_response(get("/v2/overbudget-companies.json"))
      end
    end
  end
end
