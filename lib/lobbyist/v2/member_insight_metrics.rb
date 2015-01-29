module Lobbyist
  module V2

    class MemberInsightMetrics < Lobbyist::V2::Base

      attr_accessor :revenue_from_repeat_customers, :revenue_from_new_customers, :customer_count
      attr_accessor :lifetime_value_of_customers, :customer_contact_info_distribution, :customer_interactions
      attr_accessor :customers_by_revenue, :customers_by_revenue_last_six
      attr_accessor :recommended_budget, :top_five_customers

      def self.list(company_id, params = {})
        params.merge!({company_id: company_id})
        create_from_response(get("/v2/member_insight_metrics.json", params))
      end
      
    end

  end
end
