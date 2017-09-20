module Lobbyist
  module V2
    class DataUpload < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :filename, :status, :retry_count
      attr_accessor :error_message, :data_collection_successful, :customers_count
      attr_accessor :transactions_count, :created_at, :updated_at, :vehicles_count
      attr_accessor :mileages_count, :to_be_processed, :mapper_used, :workflow_system_used
      attr_accessor :file_presigned_url, :upload_type

      # this requires us to do a multipart upload
      # hence we pass true as a parameter
      def self.create(params = {})
        create_from_response(post('/v2/data_uploads.json', params, true))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/data_uploads/#{id}.json", params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/data_uploads/#{id}.json", params))
      end

      def self.list(params = {})
        create_collection_from_response(get('/v2/data_uploads.json', params))
      end

      def self.process_file(id, params = {})
        create_from_response(put("/v2/data_uploads/#{id}/process-file.json", params))
      end
    end
  end
end
