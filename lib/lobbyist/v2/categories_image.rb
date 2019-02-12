# frozen_string_literal: true

module Lobbyist
  module V2
    class CategoriesImage < Lobbyist::V2::Base
      attr_accessor :id, :category_id, :image_filename
      attr_accessor :message_position, :content, :status
      attr_accessor :tags, :campaigns_count, :image_urls
      attr_accessor :message_offset

      def self.list(params = {})
        create_collection_from_response(get('/v2/categories-images.json', params))
      end

      def self.update(id, params = {})
        response = put("/v2/categories-images/#{id}.json", category_default_front_template: params)
        create_from_response(response)
      end

      def self.find(id, params = {})
        response = get("/v2/categories-images/#{id}.json", params)
        create_from_response(response)
      end

      def self.communication_campaigns(id, params = {})
        response = get("/v2/categories-images/#{id}/communication_campaigns.json", params)
        create_collection_from_response(response)
      end
    end
  end
end
