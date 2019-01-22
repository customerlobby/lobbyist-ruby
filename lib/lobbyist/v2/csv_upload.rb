module Lobbyist
  module V2

    class CsvUpload < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :filename, :status, :created_at, :updated_at
      attr_accessor :customers_count

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/csv-uploads.json", { csv_upload: params }, true))
      end

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/csv-uploads.json", params))
      end

      def self.process_file(id, params = {})
        create_from_response(put("/v2/csv-uploads/#{id}/process-file.json", params))
      end
    end
  end
end
