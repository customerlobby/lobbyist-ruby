module Lobbyist
  module V2
    module Admin

      class CampaignIteration < Lobbyist::V2::Base
        attr_accessor :id, :communication_campaign_id, :start_date, :end_date, :tracking_start_date, :tracking_end_date

        def self.list(params = {})
          create_collection_from_response(get("/v2/campaign-iterations.json", params))
        end
      end

    end
  end
end
