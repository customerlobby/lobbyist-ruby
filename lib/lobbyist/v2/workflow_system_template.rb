module Lobbyist
  module V2
    class WorkflowSystemTemplate < Lobbyist::V2::Base
      attr_accessor :id, :workflow_system_id, :queries, :days, :time, :upload_type, :importer_class_name
      attr_accessor :fetcher_class_name, :mapper_class_name, :created_at, :updated_at, :split_mappings

      def self.list(params = {})
        create_collection_from_response(get("/v2/workflow-system-templates.json", params))
      end
    end
  end
end
