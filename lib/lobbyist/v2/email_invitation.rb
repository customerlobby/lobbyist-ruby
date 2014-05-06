module Lobbyist
  module V2

    class EmailInvitation < Lobbyist::V2::Base
      attr_accessor :id, :contact_id, :status, :attempts, :max_attempts, :created_at
      attr_accessor :updated_at, :email_key, :accessed_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/email_invitations.json", params))
      end
      
      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/email_invitations.json", {'email_invitation' => params}))
      end
    
      def self.metrics(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/email_invitations/metrics.json", params))
      end
    end

  end
end
