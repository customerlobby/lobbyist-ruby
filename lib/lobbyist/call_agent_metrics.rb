module Lobbyist
    class CallAgentMetrics < Lobbyist::Base
      def self.list(params = {})
        create_from_response(get('/v2/call_agent_metrics.json', params))
      end
    end
end
