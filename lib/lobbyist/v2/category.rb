module Lobbyist
  module V2
    
    class Category < Lobbyist::V2::Base
      attr_accessor :id, :name, :default_services, :repeat_marketing_campaign_enabled,
                    :threshold, :min_days_between_mailing, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/categories.json', params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/categories/#{id}.json", params))
      end
  
    end
    
  end
end
