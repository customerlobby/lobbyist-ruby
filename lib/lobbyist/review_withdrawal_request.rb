module Lobbyist
  class ReviewWithdrawalRequest < Lobbyist::Base
    
    attr_accessor :id, :review_id, :status, :request_date, :note, :author_action_date, :email_key, :created_at, :updated_at
    
    def review
      @review
    end
    
    def review=(attributes)
      @review = Review.new(attributes)
    end

    def self.find(id)
      create_from_response(get("/v1/review_withdrawal_requests/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/review_withdrawal_requests.json", {'withdrawal_request' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/review_withdrawal_requests/#{id}.json", {'withdrawal_request' => params}))
    end
    
    def self.find_by_email_key(email_key, params = {})
      create_from_response(get("/v1/review_withdrawal_requests/find_by_email_key/#{email_key}.json", params))
    end
  end
end