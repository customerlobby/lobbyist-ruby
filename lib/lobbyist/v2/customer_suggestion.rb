module Lobbyist
  module V2
    
    class CustomerSuggestion < Lobbyist::V2::Base
      attr_accessor :id, :suggestion_topic_id, :company_id, :contact_id, :suggestion_answer, 
        :current_order, :created_at, :updated_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/customer_suggestions.json", params))
      end

    end
  end
end
