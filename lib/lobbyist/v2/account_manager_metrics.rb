module Lobbyist
  module V2

    class AccountManagerMetrics < Lobbyist::V2::Base
      attr_accessor :all_count, :active_count, :inactive_count, :terminated_count, :pending_termination_count
      attr_accessor :on_hold_count, :skipped_payment_count, :direct_connect_issues_count, :first_call_count
      attr_accessor :calendared_today_count, :not_calendared_count, :account_managers

      def self.company_filter_counts(id, params = {})
        create_from_response(get("/v2/account-manager-metrics/#{id}/company-filter-counts.json", params))
      end

      def self.company_status_counts(params = {})
        create_collection_from_response(get("/v2/account-manager-metrics/company-status-counts", params))
      end

      def self.revenue_by_account_manager
        response = get("/v2/account-manager-metrics/revenue-by-account-manager.json")
        create_from_response(response)
      end

      def self.activity_by_account_manager(params = {})
        create_collection_from_response(get("/v2/account-manager-metrics/activity-by-account-manager", params))
      end

      def self.member_services_totals(params = {})
        create_from_response(get("/v2/account-manager-metrics/member-services-totals", params))
      end
    end

  end
end

