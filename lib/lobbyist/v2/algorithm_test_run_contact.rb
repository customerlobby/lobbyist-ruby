module Lobbyist
  module V2

    class AlgorithmTestRunContact < Lobbyist::V2::Base
      attr_accessor :id, :algorithm_test_run_id, :contact_id, :list_type, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/algorithm-test-run-contacts.json", params))
      end
    
    end

  end
end