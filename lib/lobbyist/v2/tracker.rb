module Lobbyist
  module V2
    class Tracker < Lobbyist::V2::Base

      def self.fetch_url( params = {})
        get("v2/tracking.json", params)
      end

    end
  end
end