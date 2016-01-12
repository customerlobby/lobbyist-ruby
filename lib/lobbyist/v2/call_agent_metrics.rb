module Lobbyist
  module V2

    class CallAgentMetrics < Lobbyist::V2::Base
      def self.list(params = {})
        create_from_response(get('/v2/call_agent_metrics.json', params))
      end
    end

  end
end
