module Lobbyist
  module V2

    class AlgorithmTestRun < Lobbyist::V2::Base
      attr_accessor :id, :name, :company_id, :status, :threshold, :budget, :minimum_roi, :accelerator, :transaction_grouping_interval
      attr_accessor :min_days_between_mailings, :mail_delay_offset, :include_commercial_customers
      attr_accessor :cost_per_postcard, :proposed_customer_count, :selected_customer_count, :recommended_budget, :best_buckets
      attr_accessor :proposed_count_per_bucket, :ninety_day_ev_per_bucket, :created_at, :updated_at, :repeat_customer_transaction_threshold

      def self.list(params = {})
        create_collection_from_response(get("/v2/algorithm-test-runs.json", params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/algorithm-test-runs/#{id}.json", params))
      end

      def self.create(params = {})
        create_from_response(post("/v2/algorithm-test-runs.json", {algorithm_test_run: params}))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/algorithm-test-runs/#{id}.json", params))
      end

      def self.destroy(id, params = {})
        create_from_response(delete("/v2/algorithm-test-runs/#{id}.json", params))
      end
    end

  end
end
