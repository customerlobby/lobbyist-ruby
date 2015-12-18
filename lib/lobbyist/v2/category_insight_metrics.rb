module Lobbyist
  module V2

    class CategoryInsightMetrics < Lobbyist::V2::Base

      attr_accessor :id, :category_id, :date, :lower_quartile_ltv, :median_ltv
      attr_accessor :upper_quartile_ltv, :lower_quartile_percent_revenue_from_repeat_customers, 
      attr_accessor :median_percent_revenue_from_repeat_customers, :upper_quartile_percent_revenue_from_repeat_customers, 
      attr_accessor :avg_num_of_visits, :avg_num_of_visits_excluding_first, :avg_txn_value_index, :activity_index, 
      attr_accessor :pricing_index, :created_at, :updated_at

      def self.insights(category_id, params = {})
        create_from_response(get("/v2/categories/#{category_id}insights.json", params))
      end
      
    end

  end
end
