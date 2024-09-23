module Lobbyist
  module V2

    class ProspectCampaignMailing < Lobbyist::V2::Base

      attr_accessor :id, :prospect_campaign_id, :mailing_date, :company_id, :company_name, :campaign_name

      def self.list(params = {})
        create_collection_from_response(get('/v2/prospect_campaign_mailings.json', params))
      end
    end
  end
end
