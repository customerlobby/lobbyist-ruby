module Lobbyist
  module V2

    class CustomFilterUpload < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :filename, :status, :created_at, :updated_at

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/custom-filter-uploads.json", { csv_upload: params }))
      end

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/custom-filter-uploads.json", params))
      end

      def self.process_file(id, params = {})
        create_from_response(put("/v2/custom-filter-uploads/#{id}/process-file.json", params))
      end
    end
  end
end
