module Lobbyist
  module V2
    
    class CategoryDefaultOfferTemplate < Lobbyist::V2::Base
      attr_accessor :id, :category_id, :campaign_type, :upper_bound, :lower_bound, :content, :status, :created_at, :updated_at

      def self.list(category_id, params = {})
        create_collection_from_response(get("/v2/categories/#{category_id}/category_default_offer_templates.json", params))
      end

      def self.find(category_id, id, params = {})
        create_from_response(get("/v2/categories/#{category_id}/category_default_offer_templates/#{id}.json", params))
      end

      def self.create(category_id, params = {})
        create_from_response(post("/v2/categories/#{category_id}/category_default_offer_templates", params))
      end

      def self.update(category_id, id, params = {})
        create_from_response(put("/v2/categories/#{category_id}/category_default_offer_templates/#{id}.json", params))
      end

      def self.destroy(category_id, id, params = {})
        create_from_response(delete("/v2/categories/#{category_id}/category_default_offer_templates/#{id}.json", params))
      end

    end
    
  end
end
