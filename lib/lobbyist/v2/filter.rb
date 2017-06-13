module Lobbyist
  module V2
    class Filter < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :name, :description, :created_at, :updated_at

      def self.create(company_id, params = {})
        create_from_response(post("v2/companies/#{company_id}/filters.json", params))
      end

      def self.destroy(company_id, id)
        create_from_response(delete("/v2/companies/#{company_id}/filters/#{id}.json"))
      end

      def self.destroy_tags(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/filters/destroy-tags.json", params))
      end
    end
  end
end
