module Lobbyist
  module V2
    
    class CategoryDefaultFrontTemplate < Lobbyist::V2::Base
      attr_accessor :id, :category_id, :campaign_type, :image_filename, :message_position, :content, :status, :sequence, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/category-default-front-templates.json', params))
      end
  
    end
    
  end
end
