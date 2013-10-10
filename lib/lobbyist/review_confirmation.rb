module Lobbyist
  class ReviewConfirmation < Lobbyist::Base
    
    def self.update(id, params = {})
      passed_params = {'disposition' => params['disposition'], 'review_confirmation' => params['review_confirmation']}
      passed_params.merge!({'review' => params[:review]}) if params.has_key?(:review)
      passed_params.merge!({'contact' => params[:contact]}) if params.has_key?(:contact)
      create_from_response(put("/v1/review_confirmations/#{id}.json", passed_params))
    end
    
    def self.find_by_confirmation_key(key, params = {})
      create_from_response(get("/v1/review_confirmations/find_by_confirmation_key/#{key}.json", params))
    end
  end
end