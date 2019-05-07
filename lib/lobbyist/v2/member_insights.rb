module Lobbyist
  module V2
    class MemberInsights < Lobbyist::V2::HashieBase
      def self.find(company_id, params = {})
        response = get("/v2/member-insights/#{company_id}.json", params)
        create_response(response)
      end
    end
  end
end
