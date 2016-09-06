module Lobbyist
  module V2

    class SplitMapping < Lobbyist::V2::Base

      attr_accessor :id, :company_id, :mapped_company_id, :mapping_data, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/split_mappings.json", params))
      end

      def self.find(id)
        create_from_response(get("/v2/split_mappings/#{id}.json"))
      end

      def self.create(split_mapping_params = {})
        params = {split_mapping: split_mapping_params}
        create_from_response(post("/v2/split_mappings.json", params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/split_mappings/#{id}.json", {'split_mapping' => params}))
      end

    end
  end
end
