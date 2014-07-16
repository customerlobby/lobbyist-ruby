module Lobbyist
  module V2

    class CompanyPlace < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :name, :address1, :address2, :city, :state, :zipcode
      attr_accessor :phone_number, :source, :source_id, :match_score, :status, :created_at, :updated_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/company_places.json", params))
      end

      def self.update(company_id, place_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/company_places/#{place_id}.json", {company_place: params}))
      end
      
      def self.synchronize(company_id, place_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/company_places/#{place_id}/synchronize.json", {company_place: params}))
      end
    end

  end
end

