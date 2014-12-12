module Lobbyist
  module V2
    
    class CategoryDefaultOfferTemplate < Lobbyist::V2::Base
      attr_accessor :id, :category_id, :campaign_type, :upper_bound, :lower_bound, :content, :status, :sequence, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/category-default-offer-templates.json', params))
      end
  
    end
    
  end
end
