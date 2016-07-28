module Lobbyist
  module V2

    class MemberAggregateInsight < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :revenue_from_repeat_customers, :revenue_from_new_customers, :customers_with_transactions
      attr_accessor :ltv, :recommended_budget, :recommended_credits :credit_calculation_status, :customer_contact_info_distribution  
      attr_accessor :top_five_customers, :created_at, :updated_at, :avg_num_of_visits
      attr_accessor :avg_num_of_visits_excluding_first, :new_customer_count, :residential_customer_count
      attr_accessor :commercial_customer_count, :residential_customer_revenue, :commercial_customer_revenue

      def self.update(company_id, params)
        create_from_response(put("/v2/companies/#{company_id}/member-aggregate-insight.json", {member_aggregate_insight: params}))
      end
    end

  end
end
