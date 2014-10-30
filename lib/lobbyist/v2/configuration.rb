module Lobbyist
  module V2

    class Configuration < Lobbyist::V2::Base

      def self.list(params = {})
        create_from_response(get("/v2/configurations.json", params))
      end
      
    end

  end
end
