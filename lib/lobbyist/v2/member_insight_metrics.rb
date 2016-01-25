module Lobbyist
  module V2

    class MemberInsightMetrics < Lobbyist::V2::Base

      attr_accessor :percent_revenue_from_repeat_customers, :customer_count, :commercial_customer_count
      attr_accessor :ltv, :customer_contact_info_distribution, :customer_interactions
      attr_accessor :customers_by_revenue, :customers_by_revenue_last_six
      attr_accessor :recommended_budget, :recommended_budget_status, :top_five_customers, :status, :generated_at
      attr_accessor :avg_num_of_visits, :avg_num_of_visits_excluding_first, :new_customer_count, :residential_customer_count
      attr_accessor :commercial_customer_count, :residential_customer_revenue, :commercial_customer_revenue
      attr_accessor :transactions_index

      def self.list(company_id, params = {})
        params.merge!({company_id: company_id})
        create_from_response(get("/v2/member_insight_metrics.json", params))
      end
      
    end

  end
end
