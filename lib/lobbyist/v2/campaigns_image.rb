# frozen_string_literal: true

module Lobbyist
  module V2
    class CampaignsImage < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :company_id, :image_filename
      attr_accessor :message_position, :content, :status, :custom_image, :created_at
      attr_accessor :updated_at, :tags, :communication_campaigns, :image_urls

      def self.list(params = {})
        create_collection_from_response(get('/v2/campaigns-images.json', params))
      end

      def self.select_images(params = {})
        create_from_response(post('/v2/select-images.json', params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/campaigns-images/#{id}.json", campaigns_image: params))
      end

      def self.update_campaign_image(id, params = {})
        create_from_response(put("/v2/campaigns-images/#{id}/update-campaign-image.json", params))
      end

      def self.destroy(id, params = {})
        create_from_response(delete("/v2/campaigns-images/#{id}.json", params))
      end
    end
  end
end