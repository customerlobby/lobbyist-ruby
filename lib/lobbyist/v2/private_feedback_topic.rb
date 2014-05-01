module Lobbyist
  module V2
    
    class PrivateFeedbackTopic < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :topic_name, :current_order, :average_score

      def self.list(params = {})
        create_collection_from_response(get('/v2/private_feedback_topics.json', params))
      end

      def self.update(id, company_id, params)
        create_from_response(put("/v2/private_feedback_topics/#{id}.json", {'company_id' => company_id, 'private_feedback_topic' => params}))
      end

    end
  end
end
