module Lobbyist
  module V2
    class Filter < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :name, :description, :created_at, :updated_at

      # def self.list(params = {})
      #   create_collection_from_response(get('/v2/categories.json', params))
      # end

      def self.create(company_id, params = {})
        create_from_response(post("v2/companies/#{company_id}/filters.json", params))
      end

      # def self.update(company_id, id, params = {})
      #   create_from_response(put("/v2/companies/#{company_id}/filters/#{id}.json", params))
      # end
    end
  end
end
