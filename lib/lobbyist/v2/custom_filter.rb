module Lobbyist
  module V2
    class CustomFilter < Lobbyist::V2::HashieBase
      attr_accessor :id, :company_id, :name, :category_name, :tag_name, :description, 
                    :customers_count, :display_name, :status, :created_at, :updated_at

      def self.create(company_id, params = {})
        create_response(post("v2/companies/#{company_id}/custom_filters.json", params))
      end

      def self.destroy(company_id, id)
        create_response(delete("/v2/companies/#{company_id}/custom_filters/#{id}.json"))
      end

      def self.find(company_id, id)
        create_response(get("/v2/companies/#{company_id}/custom_filters/#{id}.json"))
      end

      def self.destroy_tags(company_id, params = {})
        create_response(post("/v2/companies/#{company_id}/custom_filters/destroy-tags.json", params))
      end

      def self.list(company_id, params = {})
        create_response(get("/v2/companies/#{company_id}/custom_filters.json", params))
      end
    end
  end
end
