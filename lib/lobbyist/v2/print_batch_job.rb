module Lobbyist
  module V2
    class PrintBatchJob < Lobbyist::V2::Base
      attr_accessor :filename, :status, :sent_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/print-batch-jobs.json', params))
      end

      def self.communication_pieces(id, params={})
        response = get("v2/print-batch-jobs/#{id}/communication-pieces.json", params)
        create_collection_from_response(response)
      end
    end
  end
end
