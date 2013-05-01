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
    
    def update
      self.class.create_from_response(self.class.put("/v1/review_flags/#{id}.json", {'review_flag' => to_params}))
    end
    
    def delete
      self.class.create_from_response(self.class.delete("/v1/review_flags/#{id}.json"))
    end
    
    def to_params
      {
        'review_id'  => self.review_id.to_s,
        'flagged'    => self.flagged.to_s,
        'exempted'   => self.exempted.to_s,
        'flagger_ip' => self.flagger_ip.to_s,
        'note'       => self.note.to_s,
        'category'   => self.category.to_s,
        'created_at' => self.created_at.to_s,
        'updated_at' => self.updated_at.to_s
      }
    end

  end
end