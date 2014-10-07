module Lobbyist
  module V2

    class ReviewComment < Lobbyist::V2::Base
      attr_accessor :id, :review_id , :comment, :user_id, :user_type, :created_at, :updated_at

      def self.list(review_id, params = {})
        create_collection_from_response(get("/v2/reviews/#{review_id}/comments.json", params))
      end
      
      def self.update(id, review_id, params = {})
        create_from_response(put("/v2/reviews/#{review_id}/comments/#{id}.json", {'review_comment' => params}))
      end

      def self.create(review_id, params = {})
        create_from_response(post("/v2/reviews/#{review_id}/comments.json", {'review_comment' => params['review_comment'], 
          'email_reviewer' =>params['email_reviewer']}))
      end

      def self.find(id, review_id, params = {})
        create_from_response(get("/v2/reviews/#{review_id}/comments/#{id}.json", {review_comment: params}))
      end

    end

  end
end
