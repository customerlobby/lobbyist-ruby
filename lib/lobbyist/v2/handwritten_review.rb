module Lobbyist
  module V2

    class HandwrittenReview < Lobbyist::V2::Base
      attr_accessor :id, :review_id, :created_at, :updated_at, :metrics

      def self.list(params = {})
        company_id = params[:company_id]
        create_collection_from_response(get("/v2/companies/#{company_id}/handwritten_reviews.json", params))
      end
    
      def self.find(id, company_id)
        create_from_response(get("/v2/companies/#{company_id}/handwritten_reviews/#{id}.json"))
      end

      def self.update(id, company_id)
        create_from_response(put("/v2/companies/#{company_id}/handwritten_reviews/#{id}.json"))
      end 
    end

  end
end