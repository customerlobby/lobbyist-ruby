module Lobbyist
  module V2

    # Account Managers are actually Admin Users, but we name-space the member servcies / account managers people here
    class AccountManager < Lobbyist::V2::Base
      attr_accessor :summary_result

      def self.member_calls_summary(admin_user_id)
        response = get("/v2/account_managers/#{admin_user_id}/member_calls_summary.json")
        create_from_response(response)
      end

    end
  end
end
