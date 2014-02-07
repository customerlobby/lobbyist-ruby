module Lobbyist
  class Category < Lobbyist::Base
    
    attr_accessor :id, :name, :created_at, :updated_at

    # /v1/categories.json
    def self.list(params = {})
      create_from_response(get("/v1/categories.json", params))
    end
  end
end