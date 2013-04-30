module Lobbyist
  class ReviewComment < Lobbyist::Base
    
    attr_accessor :id, :review_id, :comment, :company_user_id, :created_at, :updated_at
    
    def self.list(params = {})
      create_from_response(get('/v1/review_comments.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/review_comments/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/review_comments.json", {'review_comment' => params}))
    end
    
    def update
      self.class.create_from_response(self.class.put("/v1/review_comments/#{id}.json", {'review_comment' => to_params}))
    end
    
    def delete
      self.class.create_from_response(self.class.delete("/v1/review_comments/#{id}.json"))
    end
    
    def to_params
      {
        'review_id'         => self.review_id.to_s,
        'comment'           => self.comment.to_s,
        'company_user_id'   => self.company_user_id.to_s,
        'created_at'        => self.created_at.to_s,
        'updated_at'        => self.updated_at.to_s
      }
    end

  end
end