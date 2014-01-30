module Lobbyist
  module V2

    class WorkflowSystem < Lobbyist::V2::Base
      attr_accessor :id, :name, :version, :status, :database_name, :access_type
      attr_accessor :assembly_location, :assembly_version, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/workflow_systems.json", params))
      end
    end

  end
end
