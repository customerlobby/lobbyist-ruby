module Lobbyist
  module V2
    
    class Category < Lobbyist::V2::Base
      attr_accessor :id, :name, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/categories.json', params))
      end
  
    end
    
  end
end
