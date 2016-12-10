module Lobbyist
  module V2
    class WorkflowSystemTemplate < Lobbyist::V2::Base
      def self.list(params = {})
        create_collection_from_response(get("/v2/workflow_systems.json", params))
      end
    end
  end
end
