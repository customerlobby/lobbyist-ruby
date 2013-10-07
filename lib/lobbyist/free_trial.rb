module Lobbyist
  class FreeTrial < Lobbyist::Base

    def self.list(params = {})
      create_collection_from_response(get('/v1/free_trials.json', params))
    end

  end
end
