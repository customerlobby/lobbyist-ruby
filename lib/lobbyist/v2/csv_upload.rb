module Lobbyist
  module V2

    class CsvUpload < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :filename, :status, :created_at, :updated_at

      def self.create(params = {})
        create_from_response(post("/v2/data_uploads.json", params))
      end
    end

  end
end
