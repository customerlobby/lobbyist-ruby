module Lobbyist
  class ReviewConfirmation < Lobbyist::Base
    
    def self.update(id, params = {})
      create_from_response(put("/v1/review_confirmations/#{id}.json", {'review_confirmation' => params}))
    end
    
    def self.find_by_confirmation_key(key, params = {})
      create_from_response(get("/v1/review_confirmations/find_by_confirmation_key/#{key}.json", params))
    end
  end
end