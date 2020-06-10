module Lobbyist
  module V2
    class DefaultReviewDestination < Lobbyist::V2::Base
      attr_accessor :id, :display_name, :domain

      def self.list(params = {})
        create_collection_from_response(get('/v2/default_review_destinations.json', params))
      end

      def self.find(id, company_id)
        create_from_response(get("/v2/default_review_destinations/#{id}.json", company_id: company_id ))
      end

      def self.create(company_id, params)
        create_from_response(post("/v2/default_review_destinations.json", default_review_destination: params ))
      end

      def self.update(id, company_id, params)
        create_from_response(put("/v2/default_review_destinations/#{id}.json", default_review_destination: params ))
      end

      def self.destroy(id, company_id)
        create_from_response(delete("/v2/default_review_destinations/#{id}.json"))
      end
    end
  end
end
