module Lobbyist
  module V2

    class CampaignIterationResult < Lobbyist::V2::Base
      attr_accessor :id, :communication_piece_id, :amount, :transacted_at, :created_at, :updated_at

      def self.list(id, params = {})
        create_collection_from_response(get("/v2/campaign-iterations/#{id}/results.json", params))
      end

    end

  end
end
