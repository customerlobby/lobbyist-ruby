module Lobbyist
  class Tracker < Lobbyist::Base

    def self.fetch_url(tracking_id, query_string, params = {})
      get("v2/tracking/#{tracking_id}/#{query_string}.json", params)
    end

  end
end