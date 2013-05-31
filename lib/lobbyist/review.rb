module Lobbyist
  class Review < Lobbyist::Base

    attr_accessor :review_id, :count, :review_date, :review_summary, :review_body, :review_status, 
      :total_score, :source, :is_featured, :ip_address, :admin_user_id, :open_invitation, :invite_id,
      :reviewer_location_state, :reviewer_location_city, :date_modified, :post_to_facebook,
      :created_at, :updated_at
    
    def company
      @company
    end
    
    def company=(attributes)
      @company = Company.new(attributes)
    end
    
    def contact
      @contact
    end
    
    def contact=(attributes)
      @contact = Contact.new(attributes)
    end
    
    def comments
      @comments
    end
    
    def comments=(attributes)
      @comments = []
      attributes.each do |attribute|
        @comments << ReviewComment.new(attribute)
      end
    end
    
    def challenge
      @challenge
    end
    
    def challenge=(attributes)
      @challenge = ReviewChallenge.new(attributes)
    end
    
    def topics
      @topics
    end
    
    def topics=(attributes)
      @topics = []
      attributes.each do |attribute|
        @topics << Topic.new(attribute)
      end
    end
    
    def withdrawal_request
      @withdrawal_request
    end
    
    def withdrawal_request=(attributes)
      @withdrawal_request = ReviewWithdrawalRequest.new(attributes)
    end
    
    def self.list(params = {})
      create_from_response(get("/v1/reviews.json", params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/reviews/#{id}.json"))
    end

    def self.create(params = {})
      create_from_response(post("/v1/reviews.json", {'review' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/reviews/#{id}.json", {'review' => params}))
    end

    def self.destroy(id)
      create_from_response(delete("/v1/reviews/#{id}.json"))
    end

  end
end
  