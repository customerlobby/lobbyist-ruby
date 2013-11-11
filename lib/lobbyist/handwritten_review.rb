module Lobbyist
  class HandwrittenReview < Lobbyist::Base

    def self.create(params = {})
      create_from_response(post("/v1/handwritten_reviews.json", params))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/handwritten_reviews/#{id}.json", {'handwritten_review' => params}))
    end

  end
end