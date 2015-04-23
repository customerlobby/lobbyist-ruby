module Lobbyist
  module V2

    class AccountManagerMetrics < Lobbyist::V2::Base
      attr_accessor :all_count, :active_count, :inactive_count, :terminated_count, :pending_termination_count
      attr_accessor :on_hold_count, :skipped_payment_count, :direct_connect_issues_count, :first_call_count
      attr_accessor :calandared_today_count, :not_calandared_count

      def self.company_filter_counts(id, params = {})
        create_from_response(get("/v2/account-manager-metrics/#{id}/company-filter-counts.json", params))
      end

    end

  end
end

