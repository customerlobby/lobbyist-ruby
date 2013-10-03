module Lobbyist
  class SalesTeam < Lobbyist::Base

    def self.list(params = {})
      create_collection_from_response(get('/v1/sales_teams.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/sales_teams/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/sales_teams.json", {'sales_team' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/sales_teams/#{id}.json", {'sales_team' => params}))
    end
    
    def self.destroy(id, company_id)
      create_from_response(delete("/v1/sales_teams/#{id}.json"))
    end

  end
end