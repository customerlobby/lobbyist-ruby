module Lobbyist
  class ReviewChallenge < Lobbyist::Base
    
    attr_accessor :id, :review_id, :reason, :status, :read, :created_at, :updated_at
    
    def review
      @review
    end
    
    def review=(attributes)
      @review = Review.new(attributes)
    end

    def self.list(params = {})
      create_from_response(get("/v1/review_challenges.json", params))
    end

    def self.find(id)
      create_from_response(get("/v1/review_challenges/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/review_challenges.json", {'review_challenge' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/review_challenges/#{id}.json", {'review_challenge' => params}))
    end
  end
end