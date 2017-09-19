module Lobbyist
  module V2
    class DataWarehouseJob < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :status,
                    :params, :data_filename, :result_filename,
                    :job_type, :completed_at

      def self.update(id, params)
        create_from_response(
            put("/v2/data_warehouse_job/#{id}.json", params))
      end
    end
  end
end