module Lobbyist
  module V2
    class AdminUser < Lobbyist::V2::Base
      attr_accessor :admin_user_id, :email, :first_name, :last_name, :password, :is_total_admin,
                    :is_active, :screen_name, :sales_team_id, :created_at, :updated_at, :auth_key,
                    :persistence_token, :role, :employment_type

      def self.create(params = {})
        create_from_response(post('/v2/admin_users.json', 'admin_user' => params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/admin_users/#{id}.json", 'admin_user' => params))
      end

      def self.reset_password(id)
        create_from_response(get("/v2/admin_users/#{id}/reset-password.json"))
      end
    end
  end
end
