module Lobbyist
  module V2

    class CompanyUser < Lobbyist::V2::Base
      attr_accessor :company_user_id, :company_id, :date_added, :email, :confirm_reset_password
      attr_accessor :name, :first_name, :last_name, :is_active, :is_manager, :primary_contact
      attr_accessor :accepts_terms, :sugar_contact_id, :created_at, :updated_at, :role, :status
      
      def self.list(params = {})
        create_collection_from_response(get('/v2/company_users.json', params))
      end
    
      def self.find(id, company_id)
        create_from_response(get("/v2/company_users/#{id}.json", company_id: company_id))
      end
    
      def self.create(company_id, params = {})
        create_from_response(post("/v2/company_users.json", {company_id: company_id, company_user: params}))
      end
    
      def self.update(id, company_id, params = {})
        create_from_response(put("/v2/company_users/#{id}.json", {company_id: company_id, company_user: params}))
      end

      def self.primary(company_id)
        create_from_response(get("/v2/company_users/primary.json", {company_id: company_id}))
      end

      def self.reset_password(id, company_id)
        create_from_response(get("/v2/company_users/#{id}/reset-password.json", {company_id: company_id}))
      end

    end
    
  end
end
