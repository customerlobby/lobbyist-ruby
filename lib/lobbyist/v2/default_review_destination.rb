module Lobbyist
  module V2
    class DefaultReviewDestination < Lobbyist::V2::Base
      attr_accessor :id, :display_name, :domain

      def self.list(params = {})
        create_collection_from_response(get('/v2/default_review_destinations.json', params))
      end
    end
  end
end
