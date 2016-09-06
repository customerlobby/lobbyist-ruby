module Lobbyist
  module V2
    class WorkflowSystem < Lobbyist::V2::Base
      attr_accessor :id, :name, :version, :visible, :status, :database_name, :access_type 
      attr_accessor :query_keys, :data_padding_enabled, :use_processor, :customers_query, :transactions_query
      attr_accessor :respect_commercial_flag, :created_at, :updated_at, :enable_auto_invitations

      def self.list(params = {})
        create_collection_from_response(get("/v2/workflow_systems.json", params))
      end

      def self.create(params = {})
        create_from_response(post("/v2/workflow_systems.json", {"workflow_system"=>params}))
      end

      def self.find(workflow_system_id)
        create_from_response(get("/v2/workflow_systems/#{workflow_system_id}.json"))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/workflow_systems/#{id}.json", {'workflow_system' => params}))
      end
    end
  end
end
