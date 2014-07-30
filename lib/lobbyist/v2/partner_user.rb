module Lobbyist
  module V2

    class PartnerUser < Lobbyist::V2::Base
      attr_accessor :partner_user_id, :partner_account_id, :first_name, :last_name, :email
      attr_accessor :is_active, :is_owner
      
      def self.reset_password(id, params = {})
        create_from_response(get("/v2/partner_users/#{id}/reset-password.json", params))
      end

    end
    
  end
end
