module Lobbyist
  module V2
    class ChallengeCommunication < Lobbyist::V2::Base

      attr_accessor :id, :review_challenge_id, :contact_id, :admin_user_id, :user_id, :user_type,
        :communication_body, :email_key, :created_at, :updated_at

      def review_challenge
        @review_challenge
      end

      def review_challenge=(attributes)
        @review_challenge = Lobbyist::V2::ReviewChallenge.new(attributes)
      end

      def self.create(review_challenge_id, params = {})
        create_from_response(post("/v2/challenges/#{review_challenge_id}/challenge_communications.json", {'challenge_communication' => params}))
      end

      def self.find_by_email_key(email_key, params = {})
        create_from_response(get("/v2/challenge_communications/find_by_email_key/#{email_key}.json", params))
      end
    end
  end
end
