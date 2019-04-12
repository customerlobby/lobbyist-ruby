module Lobbyist
  module V2
    class FrontTemplate < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :company_id, :image_filename
      attr_accessor :message_position, :content, :status, :custom_image, :created_at
      attr_accessor :updated_at, :tags, :communication_campaigns, :image_urls

      def self.list(params = {})
        create_collection_from_response(get('/v2/front-templates.json', params))
      end

      def self.create(params = {})
        create_from_response(post('/v2/front-templates.json', { front_template: params }, true))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/front-templates/#{id}.json", front_template: params))
      end

      def self.destroy(id, params = {})
        create_from_response(delete("/v2/front-templates/#{id}.json", params))
      end

      def self.update_campaign_front_template(id, params = {})
        create_from_response(put("/v2/front-templates/#{id}/update-campaign-front-template.json", params))
      end
    end
  end
end
