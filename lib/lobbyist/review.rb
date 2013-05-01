module Lobbyist
  class Review < Lobbyist::Base

    attr_accessor :review_id, :review_date, :review_summary, :review_body, :review_status, 
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
        @topics << ReviewTopic.new(attribute)
      end
    end
    
    def withdrawal_request
      @withdrawal_request
    end
    
    def withdrawal_request=(attributes)
      @withdrawal_request = ReviewWithdrawalRequest.new(attributes)
    end
    
    def self.find(id)
      response = get("/v1/reviews/#{id}.json")
      create_from_response(response['review'])
      #create_from_response(get("/v1/reviews/#{id}.json"))
    end

    def update
      response = self.class.put("/v1/reviews/#{review_id}.json", {'review' => to_params})
      self.class.create_from_response(response['review'])
    end

    def to_params
      {
        'review_date'             => self.review_date.to_s,
        'review_summary'          => self.review_summary.to_s,
        'review_body'             => self.review_body.to_s,
        'review_status'           => self.review_status.to_s,
        'total_score'             => self.total_score.to_s,
        'source'                  => self.source.to_s,
        'is_featured'             => self.is_featured.to_s,
        'ip_address'              => self.ip_address.to_s,
        'admin_user_id'           => self.admin_user_id.to_s,
        'open_invitation'         => self.open_invitation.to_s,
        'reviewer_location_state' => self.reviewer_location_state.to_s,
        'reviewer_location_city'  => self.reviewer_location_city.to_s,
        'date_modified'           => self.date_modified.to_s,
        'post_to_facebook'        => self.post_to_facebook.to_s,
      }
    end

  end
end
  