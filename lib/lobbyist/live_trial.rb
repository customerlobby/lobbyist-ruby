module Lobbyist
  class LiveTrial < Lobbyist::Base

    def self.list(params = {})
      create_collection_from_response(get('/v1/live_trials.json', params))
    end

    def self.find(id)
      create_from_response(get("/v1/live_trials/#{id}.json"))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/live_trials/#{id}.json", {'live_trial' => params}))
    end
  end
end
