module Lobbyist
  class DataUpload < Lobbyist::Base
    attr_accessor :id, :company_id, :filename, :status, :retry_count
    attr_accessor :error_message, :data_collection_successful, :customers_count
    attr_accessor :transactions_count, :created_at, :updated_at, :vehicles_count
    attr_accessor :mileages_count, :to_be_processed, :mapper_used, :workflow_system_used
    attr_accessor :parent_company_id

    def self.list(params = {})
      create_collection_from_response(get('/v1/data_uploads.json', params))
    end
  end
end
