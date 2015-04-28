module Lobbyist
  module V2

    # Account Managers are actually Admin Users, but we name-space the member servcies / account managers people here
    class AccountManager < Lobbyist::V2::Base
      attr_accessor :summary_result, :admin_user_id, :first_name, :last_name, :email, 
      :name, :is_total_admin, :is_active, :status, :screen_name, :sales_team_id, 
      :created_at, :updated_at, :role, :employment_type, :last_request_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/account-managers.json", params))
      end

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
