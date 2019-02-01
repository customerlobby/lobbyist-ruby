module Lobbyist
  module V2

    class OfferTemplate < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :upper_bound, :lower_bound, :content, :disclaimers, :status, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/offer-templates.json', params))
      end

      def self.create(params = {})
        create_from_response(post('/v2/offer-templates.json', params))
      end

      def self.update(id, params)
        create_from_response(put("/v2/offer-templates/#{id}.json", params))
      end

      def self.destroy(id)
        create_from_response(delete("/v2/offer-templates/#{id}.json"))
      end
    end

  end
end
