module Lobbyist
  module V2
    
    class CustomerSuggestion < Lobbyist::V2::Base
      attr_accessor :id, :suggestion_topic_id, :company_id, :contact_id, :suggestion_answer, 
        :current_order, :created_at, :updated_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/customer_suggestions.json", params))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/customer_suggestions.json", {'customer_suggestion' => params}))
      end
      def self.create_unhappy_feedback(company_id, email_key, params = {})
        create_from_response(post("/v2/companies/#{company_id}/customer_suggestions/unhappy-feedback.json", {'customer_suggestion' => params, 'email_key' => email_key}))
      end
      
    end
  end
end
