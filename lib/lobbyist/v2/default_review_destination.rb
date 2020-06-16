module Lobbyist
  module V2
    class DefaultReviewDestination < Lobbyist::V2::Base
      attr_accessor :id, :display_name, :domain

      def self.list(params = {})
        create_collection_from_response(get('/v2/default_review_destinations.json', params))
      end

      def self.find(id)
        create_from_response(get("/v2/default_review_destinations/#{id}.json" ))
      end

      def self.create(params)
        create_from_response(post("/v2/default_review_destinations.json", default_review_destination: params ))
      end

      def self.update(id, params)
        create_from_response(put("/v2/default_review_destinations/#{id}.json", default_review_destination: params ))
      end

      def self.destroy(id)
        create_from_response(delete("/v2/default_review_destinations/#{id}.json"))
      end
    end
  end
end
