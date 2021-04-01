module Lobbyist
  # for company user object
  class CompanyUser < Lobbyist::Base
    attr_accessor :company_user_id, :company_id, :date_added, :email
    attr_accessor :confirm_reset_password, :first_name, :last_name, :is_active
    attr_accessor :is_manager, :primary_contact, :accepts_terms, :created_at
    attr_accessor :sugar_contact_id, :updated_at, :partner_user_id

    def self.list(params = {})
      create_from_response(get('/v1/company_users.json', params))
    end

    def self.find(id)
      create_from_response(get("/v1/company_users/#{id}.json"))
    end

    def self.create(company_id, params = {})
      create_from_response(post('/v1/company_users.json',
                                'company_id' => company_id,
                                'company_user' => params))
    end

    def self.update(id, company_id, params = {})
      create_from_response(put("/v1/company_users/#{id}.json",
                               'company_id' => company_id,
                               'company_user' => params))
    end

    def self.destroy(id, company_id)
      create_from_response(delete("/v1/company_users/#{id}.json",
                                  'company_id' => company_id))
    end

    def self.primary(company_id)
      create_from_response(get('/v1/company_users/primary.json',
                               'company_id' => company_id))
    end

    def self.reset_password(email)
      create_from_response(put('/v1/company_users/reset_password.json',
                               'company_user' => { 'reset_email' => email }))
    end

    def self.find_by_confirmation_key(key)
      create_from_response(get("/v1/company_users/find_by_confirmation_key/#{key}.json"))
    end

  end
end
