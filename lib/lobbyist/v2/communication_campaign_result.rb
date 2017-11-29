module Lobbyist
  module V2
    class CommunicationCampaignResult < Lobbyist::V2::HashieBase
      def self.list(params = {})
        create_response(get('/v2/campaign-results.json', params))
      end

      def self.find(id, params = {})
        create_response(get("/v2/campaign-results/#{id}.json", params))
      end

      def self.summary(company_id, params = {})
        create_response(get("/v2/campaign-results/summary/#{company_id}.json", params))
      end
    end
  end
end
