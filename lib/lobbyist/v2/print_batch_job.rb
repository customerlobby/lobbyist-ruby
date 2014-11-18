module Lobbyist
  module V2
    class PrintBatchJob < Lobbyist::V2::Base

      def self.communication_pieces(id, params={})
        response = get("v2/communication-pieces/#{id}/print_job.json", params)
        create_collection_from_response(response)
      end
    end
  end
end