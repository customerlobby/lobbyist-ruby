module Lobbyist
  module V2
    class CustomerFilterMetric < Lobbyist::V2::Base
      def self.list(params = {})
        create_collection_from_response(get("/v2/customer-filter-metrics.json", params))
      end

      def self.filter_categories(params = {})
        create_collection_from_response(get("/v2/filter-categories.json", params))
      end
    end
  end
end
