module Lobbyist
  module V2

    class DataWarehouseJob < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :status, :params, :data_filename, :result_filename, :job_type, :completed_at

      def self.update_status(data_warehouse_job_id, status)

        create_from_response(post("/v2/data_warehouse_job/#{data_warehouse_job_id}/status.json",
                                  {data_warehouse_job_id: data_warehouse_job_id, status: status}))
      end
    end
  end
end