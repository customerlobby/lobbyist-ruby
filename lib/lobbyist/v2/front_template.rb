module Lobbyist
  module V2
    
    class FrontTemplate < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :image_filename, :message_position, :content, :status, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/front-templates.json', params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/front-templates/#{id}.json", {front_template: params}))
      end
  
    end
    
  end
end
