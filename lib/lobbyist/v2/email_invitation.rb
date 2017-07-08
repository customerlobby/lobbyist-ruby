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

      def self.reset(id, company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/email_invitations/#{id}/reset", {contact: params}))
      end

      def self.find_by_email_key(email_key, params = {})
        create_from_response(get("/v2/email_invitations/find_by_email_key/#{email_key}", params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/email_invitations/update/#{id}", {'email_invitation' => params}))
      end
    end

  end
end
