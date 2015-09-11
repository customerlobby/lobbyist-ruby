module Lobbyist
  module V2

    class RecommendedBudget < Lobbyist::V2::Base
      attr_accessor :id, :budget, :calculated_at, :include_commercial, :include_unpaid

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/recommended_budgets.json", params))
      end

    end
  end
end
