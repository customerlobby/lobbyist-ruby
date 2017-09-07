module Lobbyist
  module V2

    class Review < Lobbyist::V2::Base
      attr_accessor :review_id, :company_id,:review_summary, :review_body, :review_status, :total_score, :source,
      :is_featured, :admin_user_id, :invite_id, :reviewer_location_state, :reviewer_location_city, :review_date,
      :created_at, :updated_at, :customer_full_name

      def company
        @company
      end

      def company=(attributes)
        @company = Company.new(attributes)
      end

      def contact
        @contact
      end

      def contact=(attributes)
        @contact = Contact.new(attributes)
      end

      def comments
        @comments
      end

      def comments=(attributes)
        @comments = []
        attributes.each do |attribute|
          @comments << ReviewComment.new(attribute)
        end
      end

      def challenge
        @challenge
      end

      def challenge=(attributes)
        @challenge = ReviewChallenge.new(attributes)
      end

      def review_confirmation
        @review_confirmation
      end

      def review_confirmation=(attributes)
        @review_confirmation = ReviewConfirmation.new(attributes)
      end

      def topics
        @topics
      end

      def topics=(attributes)
        @topics = []
        attributes.each do |attribute|
          @topics << ReviewTopic.new(attribute)
        end
      end

      def withdrawal_request
        @withdrawal_request
      end

      def withdrawal_request=(attributes)
        @withdrawal_request = ReviewWithdrawalRequest.new(attributes)
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/reviews.json", params))
      end

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/reviews.json", params))
      end

      def self.enterprise_list(enterprise_id, params = {})
        create_collection_from_response(get("/v2/enterprises/#{enterprise_id}/enterprise-reviews.json", params))
      end

      def self.update(id, company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/reviews/#{id}.json", {'review' => params }))
        # create_from_response(put("/v2/companies/#{company_id}/reviews/#{1d}.json", {review: params}))
      end

      def self.find(id, company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/reviews/#{id}.json", {review: params}))

      end

    end

  end
end
