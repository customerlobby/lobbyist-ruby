module Lobbyist
  module V2
    class SupportedCampaigns < Lobbyist::V2::HashieBase
      def self.list(params = {})
        create_response(get('/v2/supported_campaigns.json', params))
      end
    end
  end
end
