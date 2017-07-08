module Lobbyist
  class ReviewFlag < Lobbyist::Base
    
    attr_accessor :id, :review_id, :flagged, :exempted, :flagger_ip, :note, :category, :created_at, :updated_at
    
    def review
      @review
    end
    
    def review=(attributes)
      @review = Review.new(attributes)
    end
    
    def self.list(params = {})
      create_from_response(get('/v1/review_flags.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/review_flags/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/review_flags.json", {'review_flag' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/review_flags/#{id}.json", {'review_flag' => params}))
    end
    
    def self.destroy(id)
      create_from_response(delete("/v1/review_flags/#{id}.json"))
    end
    
  end
end
