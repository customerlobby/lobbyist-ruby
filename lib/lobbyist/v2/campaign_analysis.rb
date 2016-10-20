module Lobbyist
  module V2

    class CampaignAnalysis < Lobbyist::V2::Base

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/campaign_analysis.json", params))
      end

    end

  end
end
