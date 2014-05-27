module Lobbyist
  module V2

    class ReviewComment < Lobbyist::V2::Base
      attr_accessor :id, :review_id , :status, :request_date, :note, :author_action_date, :email_key, :created_at, :updated_at

      def self.list(review_id, params = {})
        create_collection_from_response(get("/v2/reviews/#{review_id}/comments.json", params))
      end
      
      def self.update(id, company_id, params = {})
        create_from_response(put("/v2/reviews/#{review_id}/comments/#{id}.json", {'review_comment' => params}))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/reviews/#{review_id}/comments.json", {'review_comment' => params}))
      end

      def self.find(id, company_id, params = {})
        create_from_response(get("/v2/reviews/#{review_id}/comments/#{id}.json", {review_comment: params}))
      end

    end

  end
end
