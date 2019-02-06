module Lobbyist
  module V2
    class Filter < Lobbyist::V2::HashieBase
      attr_accessor :id, :company_id, :name, :defined_by, :display_name, :visible
      attr_accessor :default_filter_id, :category_name, :customers_count
      attr_accessor :created_at, :updated_at, :meta_data, :company_meta_data
      attr_accessor :explanation

      def self.create(company_id, params = {})
        params[:company_id] = company_id
        create_response(post("v2/filters.json", params))
      end

      def self.clone(company_id, params = {})
        params[:company_id] = company_id
        create_response(post("v2/filters/clone.json", params))
      end

      def self.find(company_id, id, params = {})
        params[:company_id] = company_id
        create_response(get("/v2/filters/#{id}.json", params))
      end

      def self.query(company_id, id, params = {})
        params[:company_id] = company_id
        create_response(get("/v2/filters/#{id}/query.json", params))
      end

      def self.destroy(company_id, id, params = {})
        params[:company_id] = company_id
        create_response(delete("/v2/filters/#{id}.json", params))
      end

      def self.update(company_id, id, params = {})
        params[:company_id] = company_id
        create_response(put("/v2/filters/#{id}.json", params))
      end

      def self.list(params = {})
        create_response(get('/v2/filters.json', params))
      end
    end
  end
end
