# frozen_string_literal: true

module Lobbyist
  module V2
    class ImagesVariation < Lobbyist::V2::Base
      attr_accessor :id, :image_filename
      attr_accessor :message_position, :content
      attr_accessor :message_offset, :image_urls

      def self.list(params = {})
        create_collection_from_response(get('/v2/images-variations.json', params))
      end

      def self.update(id, params = {})
        response = put("/v2/images-variations/#{id}.json", images_variation: params)
        create_from_response(response)
      end

      def self.create(params = {})
        create_from_response(post('/v2/images-variations.json', { images_variation: params }, true))
      end

      def self.find(id, params = {})
        response = get("/v2/images-variations/#{id}.json", params)
        create_from_response(response)
      end

      def self.communication_campaigns(id, params = {})
        response = get("/v2/images-variations/#{id}/communication_campaigns.json", params)
        create_collection_from_response(response)
      end
    end
  end
end
