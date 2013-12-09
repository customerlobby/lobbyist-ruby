module Lobbyist
  class ReviewConfirmation < Lobbyist::Base

    attr_accessor :id, :review_id, :confirmation_type, :confirmation_key, :attempts, 
      :max_attempts, :status, :from_phone_number, :to_phone_number, :from_ip_address, 
      :delivered_at, :created_at, :updated_at

    def self.update(id, params = {})
      passed_params = {'disposition' => params['disposition'], 'review_confirmation' => params['review_confirmation']}
      passed_params.merge!({'review' => params[:review]}) if params.has_key?(:review)
      passed_params.merge!({'contact' => params[:contact]}) if params.has_key?(:contact)
      passed_params.merge!({'contact_suggestions' => params[:contact_suggestions]}) if params.has_key?(:contact_suggestions)
      create_from_response(put("/v1/review_confirmations/#{id}.json", passed_params))
    end

    def self.find_by_confirmation_key(key, params = {})
      create_from_response(get("/v1/review_confirmations/find_by_confirmation_key/#{key}.json", params))
    end
  end
end
