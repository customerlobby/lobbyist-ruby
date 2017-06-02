module Lobbyist
  module V2

    class Review < Lobbyist::V2::Base
      attr_accessor :review_id, :company_id,:review_summary, :review_body, :review_status, :total_score, :source,
      :is_featured, :admin_user_id, :invite_id, :reviewer_location_state, :reviewer_location_city, :review_date,
      :created_at, :updated_at, :customer_full_name

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/reviews.json", params))
      end

      def self.enterprise_list(enterprise_id, params = {})
        create_collection_from_response(get("/v2/enterprises/#{enterprise_id}/enterprise-reviews.json", params))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/reviews.json", params))
      end

      def self.update(id, company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/reviews/#{id}.json", {'review' => params }))
      end

      def self.find(id, company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/reviews/#{id}.json", {review: params}))

      end

    end

  end
end
