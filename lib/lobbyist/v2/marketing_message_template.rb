module Lobbyist
  module V2
    
    class MarketingMessageTemplate < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :content, :status, :sequence, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/marketing-message-templates.json', params))
      end

      def self.create(params = {})
        create_from_response(post('/v2/marketing-message-templates.json', params))
      end
    
      def self.update(id, params)
        create_from_response(put("/v2/marketing-message-templates/#{id}.json", params))
      end

    end
    
  end
end
