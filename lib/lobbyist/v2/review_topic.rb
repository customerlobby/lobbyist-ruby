module Lobbyist
  module V2
    
    class ReviewTopic < Lobbyist::V2::Base
      attr_accessor :review_topic_id, :company_id, :topic_name, :current_order, :average_score

      def self.list(params = {})
        create_collection_from_response(get('/v2/review_topics.json', params))
      end

      def self.update(id, company_id, params)
        create_from_response(put("/v2/review_topics/#{id}.json", {'company_id' => company_id, 'review_topic' => params}))
      end

    end
  end
end
