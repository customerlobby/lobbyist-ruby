module Lobbyist
  module V2
    
    class FrontTemplate < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :image_filename, :message_position, :content, :status, :sequence, :created_at, :updated_at

      def self.create(params = {})
        create_from_response(post('/v2/front-templates.json', params))
      end
  
    end
    
  end
end
