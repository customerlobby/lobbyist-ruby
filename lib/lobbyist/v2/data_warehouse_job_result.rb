module Lobbyist
  module V2
    class DataWarehouseJobResult < Lobbyist::V2::Base
      attr_accessor :id, :data_warehouse_job_id, :result

      def self.create(data_warehouse_job_id, data_warehouse_job_result_params = {})
        params = {data_warehouse_job_id: data_warehouse_job_id,
                  data_warehouse_job_result: data_warehouse_job_result_params}
        create_from_response(post('/v2/data_warehouse_job_result.json', params))
      end
    end
  end
end