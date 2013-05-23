module Lobbyist
  class ReviewsCount < Lobbyist::Base
  	attr_accessor :published_reviews, :pending_reviews, :withdrawal_requested_reviews, :not_published_reviews, :challenged_reviews
  end
end