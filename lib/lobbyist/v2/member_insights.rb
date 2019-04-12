module Lobbyist
  module V2
    class MemberInsights < Lobbyist::V2::Base
      attr_accessor :id

      def self.insights(company_id, params = {})
        response = get("/v2/member-insights/#{company_id}.json", params)
        create_from_response(response)
      end
    end
  end
end
