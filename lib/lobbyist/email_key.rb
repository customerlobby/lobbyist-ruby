module Lobbyist
  class EmailKey < Lobbyist::Base
    
    attr_accessor :id, :key, :action, :emailable_id, :emailable_type, :accessed_at, :created_at, :updated_at
    
    def self.find_by_key(key)
      create_from_response(get("/v1/email_keys/find_by_key/#{key}.json"))
    end
    
  end
end