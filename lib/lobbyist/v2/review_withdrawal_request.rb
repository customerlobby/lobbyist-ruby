module Lobbyist
  module V2

    class ReviewWithdrawalRequest < Lobbyist::V2::Base
      attr_accessor :id, :review_id , :status, :request_date, :note, :author_action_date, :email_key, :created_at, :updated_at

      def self.list(review_id, params = {})
        create_collection_from_response(get("/v2/reviews/#{review_id}/withdrawal_requests.json", params))
      end
      
      def self.update(id, company_id, params = {})
        create_from_response(put("/v2/reviews/#{review_id}/withdrawal_requests/#{id}.json", {'review_withdrawal_request' => params}))
      end

      def self.find(id, company_id, params = {})
        create_from_response(get("/v2/reviews/#{review_id}/withdrawal_requests/#{id}.json", {review_withdrawal_request: params}))
      end

    end

  end
end
