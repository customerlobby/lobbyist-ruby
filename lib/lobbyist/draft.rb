module Lobbyist
  class Draft < Lobbyist::Base

    attr_accessor  :inviteable_id, :inviteable_type, :review_summary, :review_body, :review_status, 
      :reviewer_location_state, :reviewer_location_city, :admin_user_id, :created_at, :updated_at
    
    def contact
      @contact
    end
    
    def contact=(attributes)
      @contact = ContactDraft.new(attributes)
    end

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

  end
end
  