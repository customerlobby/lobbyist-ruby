module Lobbyist
  module V2

    class ReviewChallenge < Lobbyist::V2::Base
      attr_accessor :id, :review_id , :reason, :status, :read, :created_at, :updated_at

      def self.list(review_id, params = {})
        create_collection_from_response(get("/v2/reviews/#{review_id}/challenges.json", params))
      end

      def self.create(review_id, params = {})
        create_from_response(post("/v2/reviews/#{review_id}/challenges.json", {'review_challenge' => params['review_challenge'],
         'communication' => params['communication']}))
      end

      def self.update(id, review_id, params = {})
        create_from_response(put("/v2/reviews/#{review_id}/challenges/#{id}.json", {'review_challenge' => params}))
      end

      def self.find(id, review_id, params = {})
        create_from_response(get("/v2/reviews/#{review_id}/challenges/#{id}.json", {review_challenge: params}))
      end

    end

  end
end
