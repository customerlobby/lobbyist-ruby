module Lobbyist
  module V2

    class EnterpriseMetrics < Lobbyist::V2::Base

      def self.list(enterprise_id, params = {})
        create_from_response(get("/v2/enterprises/#{enterprise_id}/enterprise_metrics.json", params))
      end
      
    end

  end
end
