# frozen_string_literal: true

module Lobbyist
  module V2
    class CampaignCloneHistory < Lobbyist::V2::Base
      attr_accessor :id, :parent_id, :child_id, :status, :created_at

      class << self
        def list(params = {})
          create_collection_from_response(get("/v2/campaign_clone_histories.json", params))
        end

        def create(params = {})
          create_from_response(post('/v2/campaign_clone_histories.json', params))
        end
      end
    end
  end
end
