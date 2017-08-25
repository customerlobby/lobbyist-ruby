module Lobbyist
  module V2
    class SuggestionTopic < Lobbyist::V2::Base

      attr_accessor :id, :company_id, :suggestion_topic, :current_order
    end
  end
end
