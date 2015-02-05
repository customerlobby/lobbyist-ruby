module Lobbyist
  module V2
    
    class MemberAggregateInsight < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :revenue_from_repeat_customers, :revenue_from_new_customers, :customers_with_transactions
      attr_accessor :lifetime_value_of_customers, :recommended_budget, :recommended_budget_status, :customer_contact_info_distribution
      attr_accessor :top_five_customers, :created_at, :updated_at

      def self.update(company_id, params)
        create_from_response(put("/v2/companies/#{company_id}/member-aggregate-insight.json", {member_aggregate_insight: params}))
      end
    end
    
  end
end
