module Lobbyist
  class ReviewWithdrawalRequest < Lobbyist::Base
    
    attr_accessor :id, :review_id, :status, :request_date, :note, :author_action_date, :email_key, :created_at, :updated_at
    
  end
end