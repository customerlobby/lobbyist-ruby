module Lobbyist
  class Draft < Lobbyist::Base

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

    def self.find(id)
      create_from_response(get("/v1/draft/#{id}.json"))
    end

    def self.create(params = {})
      create_from_response(post("/v1/draft.json", {'draft' => params}))
    end

    def self.update(id, params = {})
      create_from_response(put("/v1/drafts/#{id}.json", {'draft' => params}))
    end
  end
end

