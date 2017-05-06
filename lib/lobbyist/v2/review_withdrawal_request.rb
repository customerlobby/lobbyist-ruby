module Lobbyist
  module V2

    class ReviewWithdrawalRequest < Lobbyist::V2::Base
      attr_accessor :id, :review_id , :status, :request_date, :note, :author_action_date, :email_key, :created_at, :updated_at

      def self.list(review_id, params = {})
        create_collection_from_response(get("/v2/reviews/#{review_id}/withdrawal_requests.json", params))
      end

      def self.create(review_id, params = {})
        create_from_response(post("/v2/reviews/#{review_id}/withdrawal_requests.json", {'review_withdrawal_request' => params['review_withdrawal_request']}))
      end

      def self.update(id, review_id, params = {})
        create_from_response(put("/v2/reviews/#{review_id}/withdrawal_requests/#{id}.json", {'review_withdrawal_request' => params}))
      end

      def self.find(id, review_id, params = {})
        create_from_response(get("/v2/reviews/#{review_id}/withdrawal_requests/#{id}.json", {review_withdrawal_request: params}))
      end

      def self.find_by_email_key(email_key, params = {})
        create_from_response(get("/v2/withdrawal_requests/find_by_email_key/#{email_key}.json", params))
      end
    end

  end
end
