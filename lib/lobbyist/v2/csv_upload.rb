module Lobbyist
  module V2

    class CsvUpload < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :filename, :status, :created_at, :updated_at

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/csv_uploads.json", {csv_upload: params}))
      end
    end

  end
end
