module Lobbyist
  class ReviewComment < Lobbyist::Base
    
    attr_accessor :id, :review_id, :comment, :user_id, :user_type, :created_at, :updated_at
    
    def self.list(params = {})
      create_from_response(get('/v1/review_comments.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/review_comments/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/review_comments.json", {'review_comment' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/review_comments/#{id}.json", {'review_comment' => params}))
    end
    
    def self.destroy
      create_from_response(delete("/v1/review_comments/#{id}.json"))
    end
    
  end
end