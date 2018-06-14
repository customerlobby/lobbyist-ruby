module Lobbyist
  module V2
    class CategoryDefaultFrontTemplate < Lobbyist::V2::Base
      attr_accessor :id, :category_id, :image_filename
      attr_accessor :message_position, :content, :status
      attr_accessor :tags, :communication_campaigns

      def self.list(params = {})
        create_collection_from_response(get('/v2/category-default-front-templates.json', params))
      end

      def self.update(id, params = {})
        response = put("/v2/category-default-front-templates/#{id}.json", category_default_front_template: params)
        create_from_response(response)
      end

      def self.find(id, params = {})
        response = get("/v2/category-default-front-templates/#{id}.json", params)
        create_from_response(response)
      end
    end
  end
end
