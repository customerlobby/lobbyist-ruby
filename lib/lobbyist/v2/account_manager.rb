module Lobbyist
  module V2

    # Account Managers are actually Admin Users, but we name-space the member servcies / account managers people here
    class AccountManager < Lobbyist::V2::Base
      attr_accessor :summary_result

      def self.member_calls_summary(admin_user_id)
        response = get("/v2/account-managers/#{admin_user_id}/member-calls-summary.json")
        create_from_response(response)
      end

      def self.mrr_summary(admin_user_id)
        response = get("/v2/account-managers/#{admin_user_id}/mrr-summary.json")
        create_from_response(response)
      end

    end
  end
end
