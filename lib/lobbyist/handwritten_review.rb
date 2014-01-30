module Lobbyist
  class HandwrittenReview < Lobbyist::Base
    attr_accessor :id, :contact_id, :admin_user_id, :handwritten_review_credit_id
    attr_accessor :status, :created_at, :updated_at

    def self.create(params = {})
      create_from_response(post("/v1/handwritten_reviews.json", params))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/handwritten_reviews/#{id}.json", {'handwritten_review' => params}))
    end

  end
end
