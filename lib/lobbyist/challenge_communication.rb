module Lobbyist
  class ChallengeCommunication < Lobbyist::Base

    attr_accessor :id, :review_challenge_id, :contact_id, :admin_user_id, :company_user_id,
      :communication_body, :email_key, :created_at, :updated_at

    def review_challenge
      @review_challenge
    end

    def review_challenge=(attributes)
      @review_challenge = Lobbyist::ReviewChallenge.new(attributes)
    end

    def self.list(params = {})
      create_from_response(get("/v1/challenge_communications.json", params))
    end

    def self.find(id)
      create_from_response(get("/v1/challenge_communications/#{id}.json"))
    end

    def self.create(params = {})
      create_from_response(post("/v1/challenge_communications.json", {'challenge_communication' => params}))
    end

    def self.find_by_email_key(email_key, params = {})
      create_from_response(get("/v1/challenge_communications/find_by_email_key/#{email_key}.json", params))
    end
  end
end
