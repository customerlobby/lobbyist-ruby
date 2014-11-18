module Lobbyist
  module V2
    class PrintBatchJob < Lobbyist::V2::Base

      def self.communication_pieces(id, params={})
        response = get("v2/print-batch-jobs/#{id}/communication-pieces.json", params)
        create_collection_from_response(response)
      end
    end
  end
end