module Lobbyist
  module V2
    class CustomersSegmentation < Lobbyist::V2::Base
      attr_accessor :customers_count, :customers_in_segment, :repeat_customer_rate

      def self.list(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/customers_segmentation.json", params))
      end
    end
  end
end
