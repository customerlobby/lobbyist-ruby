module Lobbyist
  module V2
    class ReviewFlag < Lobbyist::V2::Base

      attr_accessor :id, :review_id, :flagged, :exempted, :flagger_ip, :note, :category, :created_at, :updated_at

      def review
        @review
      end

      def review=(attributes)
        @review = Review.new(attributes)
      end

      def self.create(params = {})
        create_from_response(post("/v2/review_flags.json", {'review_flag' => params}))
      end

    end
  end
end
