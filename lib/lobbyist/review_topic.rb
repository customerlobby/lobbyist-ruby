module Lobbyist
  class ReviewTopic < Lobbyist::Base

    attr_accessor :review_topic_id, :company_id, :review_topic, :current_order, :average_score
    
  end
end
