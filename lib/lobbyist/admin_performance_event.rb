module Lobbyist
  class AdminPerformanceEvent < Lobbyist::Base
    attr_accessor :id, :admin_user_id, :name, :entity_id, :entity_type, :created_at, :updated_at
    
    # def self.list(params = {})
    #   create_collection_from_response(get('/v1/customer_calls.json', params))
    # end
    
  end
end