module Lobbyist
  module V2
    class ReviewsCount < Lobbyist::V2::Base
      attr_accessor :published_reviews, :pending_reviews, :withdrawal_requested_reviews, :not_published_reviews, :challenged_reviews
    end
  end
end
