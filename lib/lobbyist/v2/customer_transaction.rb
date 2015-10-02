module Lobbyist
  module V2

    class CustomerTransaction < Lobbyist::V2::Base
      attr_accessor :id, :communication_piece_id, :uuid, :contact_id, :external_id, :receipt_number, :category,
                    :event, :due_date, :amount, :is_paid, :transacted_at, :created_at, :updated_at,
                    :customer_name, :customer_address1, :customer_address2, :customer_city, :customer_state, :customer_zip,


      def self.list(id, params = {})
        create_collection_from_response(get("/v2/campaign-iterations/#{id}/transactions.json", params))
      end

    end

  end
end
