module Lobbyist
  module V2
    class ReviewDraft < Lobbyist::V2::Base

      attr_accessor :id,  :inviteable_id, :inviteable_type, :review_summary, :review_body, :review_status,
        :reviewer_location_state, :reviewer_location_city, :admin_user_id, :created_at, :updated_at


      def suggestions
        @suggestions
      end

      def suggestions=(attributes)
        @suggestions = []
        attributes.each do |attribute|
          @suggestions << ReviewSuggestion.new(attribute)
        end
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

      def self.update(id, params = {})
        create_from_response(put("/v1/drafts/#{id}.json", {'review_draft' => params}))
      end
    end
  end
end

