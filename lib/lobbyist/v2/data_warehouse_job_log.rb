module Lobbyist
  module V2
    class DataWarehouseJobLog < Lobbyist::V2::Base
      attr_accessor :id, :data_warehouse_job_id, :log_type, :message

      def self.create(data_warehouse_job_id, data_warehouse_job_log_params = {})
        params = {data_warehouse_job_id: data_warehouse_job_id, data_warehouse_job_log: data_warehouse_job_log_params}
        create_from_response(post('/v2/data_warehouse_job_log.json', params))
      end
    end
  end
end