module Lobbyist
  module V2

    class MonthlyRecurringRevenue < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :account_manager_id, :category, :start_date, :end_date
      attr_accessor :target_payment_date, :target_mrr, :target_monthly_fee, :target_mail_budget
      attr_accessor :collected_payment_date, :collected_mrr, :collected_monthly_fee, :collected_mail_budget
      attr_accessor :collected_payments, :collected_refunds, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/monthly-recurring-revenues.json", params))
      end
    end

  end
end

