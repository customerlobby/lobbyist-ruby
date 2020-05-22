module Lobbyist
  module V2
    class ReviewDestination < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :default_review_destination_id,
                    :url, :meta_data

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/review_destinations.json", params))
      end

      def self.find(id, company_id)
        create_from_response(get("/v2/companies/#{company_id}/review_destinations/#{id}.json", company_id: company_id ))
      end

      def self.create(company_id, params)
        create_from_response(post("/v2/companies/#{company_id}/review_destinations.json", review_destination: params ))
      end

      def self.update(id, company_id, params)
        create_from_response(put("/v2/companies/#{company_id}/review_destinations/#{id}.json", review_destination: params ))
      end

      def self.destroy(id, company_id)
        create_from_response(delete("/v2/companies/#{company_id}/review_destinations/#{id}.json"))
      end
    end
  end
end
