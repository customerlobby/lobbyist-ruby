module Lobbyist
  module V2

    # for company user object
    class CompanyUser < Lobbyist::V2::Base
      attr_accessor :company_user_id, :company_id, :date_added, :email
      attr_accessor :confirm_reset_password, :name, :first_name, :last_name
      attr_accessor :is_active, :is_manager, :primary_contact, :accepts_terms
      attr_accessor :sugar_contact_id, :created_at, :updated_at, :role, :status
      attr_accessor :otp

      def self.list(params = {})
        create_collection_from_response(get('/v2/company_users.json', params))
      end

      def self.find(id, company_id)
        create_from_response(get("/v2/company_users/#{id}.json",
                                 company_id: company_id))
      end

      def self.create(company_id, params = {})
        create_from_response(post('/v2/company_users.json',
                                  company_id: company_id, company_user: params))
      end

      def self.update(id, company_id, params = {})
        create_from_response(put("/v2/company_users/#{id}.json",
                                 company_id: company_id, company_user: params))
      end

      def self.destroy(id, company_id)
        create_from_response(delete("/v2/company_users/#{id}.json",
                                    company_id: company_id))
      end

      def self.primary(company_id)
        create_from_response(get('/v2/company_users/primary.json',
                                 company_id: company_id))
      end

      def self.reset_password(id, company_id)
        create_from_response(get("/v2/company_users/#{id}/reset-password.json",
                                 company_id: company_id))
      end

      def self.request_support(id, company_id, params = {})
        create_from_response(get("/v2/company_users/#{id}/request-support.json",
                                 company_id: company_id, company_user: params))
      end

    end

  end
end
