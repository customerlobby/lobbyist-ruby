module Lobbyist
  module V2
    class DirectConnectSetupStep < Lobbyist::V2::Base
      attr_accessor :company_id, :step, :status, :recorded_date, :data_upload_id

      def self.update(id, params = {})
        create_from_response(put("/v2/direct_connect_setup_steps/#{id}.json", params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/direct_connect_setup_steps/#{id}.json", params))
      end

      def self.list(params = {})
        create_collection_from_response_with_model_name(get('/v2/direct_connect_setup_steps.json', params))
      end
    end
  end
end
