module Lobbyist
  module V2

    class EnterpriseUser < Lobbyist::V2::Base
      attr_accessor :id, :enterprise_id, :first_name, :last_name, :email, :login_count
      attr_accessor :last_requested_at, :current_login_at, :current_login_ip, :last_login_ip
      attr_accessor :status, :role, :created_at, :updated_at

      def name
        "#{first_name} #{last_name}"
      end

      def self.list(params = {})
        create_collection_from_response(get("/v2/enterprise_users.json", params))
      end
      
      def self.show(id, params = {})
        create_from_response(get("/v2/enterprise_users/#{id}.json", params))
      end
      
      def self.create(id, params)
        user_params = {enterprise_id: id, enterprise_user: params}
        create_from_response(post("/v2/enterprise_users.json", user_params))
      end
      
      def self.update(id, params)
        create_from_response(put("/v2/enterprise_users/#{id}.json", {enterprise_user: params}))
      end
      
      def self.destroy(id, params)
        create_from_response(delete("/v2/enterprise_users/#{id}.json", params))
      end
      
      def self.reset_password(id)
        create_from_response(get("/v2/enterprise_users/#{id}/reset-password.json"))
      end
    end

  end
end
