module Lobbyist
  class Metrics < Lobbyist::Base
    def self.list(params = {})
      create_from_response(get('/v1/metrics.json', params))
    end
  end
end
