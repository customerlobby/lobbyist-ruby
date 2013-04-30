module Lobbyist
  class ReviewChallenge < Lobbyist::Base
    
    attr_accessor :id, :review_id, :reason, :status, :read, :created_at, :updated_at
    
  end
end