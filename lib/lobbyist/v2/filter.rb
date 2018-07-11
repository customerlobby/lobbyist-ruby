module Lobbyist
  module V2
    class Filter < Lobbyist::V2::HashieBase
      attr_accessor :id, :company_id, :name, :short_name, :defined_by, :display_name, :visible
      attr_accessor :default_filter_id, :feature, :category_name, :description, :customers_count
      attr_accessor :created_at, :updated_at, :meta_data, :company_meta_data 

      def self.create(company_id, params = {})
        create_response(post("v2/filters.json", params))
      end

      def self.find(company_id, id)
        create_response(get("/v2/filters/#{id}.json"))
      end

      def self.destroy(company_id, id)
        create_response(delete("/v2/filters/#{id}.json"))
      end

      def self.list(company_id, params = {})
        create_response(get('/v2/filters.json', params))
      end
    end
  end
end
