# frozen_string_literal: true

module Lobbyist
  module V2
    # lobbyist call to make calls to IterationResults resource on api
    class IterationResults < Lobbyist::V2::HashieBase
      attr_accessor :piece_id, :customer_name, :transacted_at, :amount, :days_since_prev_txn

      def self.list(params = {})
        create_response(get('v2/iteration-results.json', params))
      end

      def self.generate_results_file(id, params = {})
        response = post("v2/iteration-results/#{id}/generate-file.json", params)
        create_response(response)
      end
    end
  end
end
