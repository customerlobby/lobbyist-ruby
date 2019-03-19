module Lobbyist
  module V2
    class CustomersSegmentation < Lobbyist::V2::HashieBase
      attr_accessor :customers_count, :customers_in_segment, :repeat_customer_rate

      def self.list(company_id, params = {})
        create_response(post("/v2/companies/#{company_id}/customers_segmentation/list.json", params))
      end
    end
  end
end
