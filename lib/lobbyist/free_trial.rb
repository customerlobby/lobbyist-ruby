module Lobbyist
  class FreeTrial < Lobbyist::Base

    def self.list(params = {})
      create_collection_from_response(get('/v1/free_trials.json', params))
    end

     def self.find(id)
      create_from_response(get("/v1/free_trials/#{id}.json"))
    end
    
   	def self.update(id, params = {})
      create_from_response(put("/v1/free_trials/#{id}.json", {'free_trial' => params}))
    end
  end
end
