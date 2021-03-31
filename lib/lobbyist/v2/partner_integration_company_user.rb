module Lobbyist
  module V2
    # for partner integration user
    class PartnerIntegrationCompanyUser < Lobbyist::V2::Base
      attr_accessor :authenticated, :token, :company_user_id, :company_id, :first_name, :last_name

      def self.login(partner_name, params = {})
        create_from_response(post("/partner_integrations/#{partner_name}/login.json", params))
      end
    end
  end
end
