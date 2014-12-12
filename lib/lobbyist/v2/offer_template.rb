module Lobbyist
  module V2
    
    class OfferTemplate < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :upper_bound, :lower_bound, :content, :status, :sequence, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/offer-templates.json', params))
      end

      def self.create(params = {})
        create_from_response(post('/v2/offer-templates.json', params))
      end
    
      def self.update(id, params)
        create_from_response(put("/v2/offer-templates/#{id}.json", params))
      end

    end
    
  end
end
