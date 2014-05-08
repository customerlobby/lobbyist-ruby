module Lobbyist
  module V2

    class EmailInvitationMetrics < Lobbyist::V2::Base

      def self.list(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/email_invitation_metrics.json", params))
      end
      
    end

  end
end
