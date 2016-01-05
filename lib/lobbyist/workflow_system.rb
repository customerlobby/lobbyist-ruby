module Lobbyist

  class WorkflowSystem < Lobbyist::Base
    attr_accessor :id, :name, :version, :status, :visible, :database_name, :access_type
    attr_accessor :data_padding_enabled, :use_processor, :respect_commercial_flag
    attr_accessor :enable_auto_invitations, :created_at, :updated_at

    def self.list(params = {})
      create_collection_from_response(get("/v1/workflow_systems.json", params))
    end
    
  end

end

