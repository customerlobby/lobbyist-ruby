module Lobbyist
  class CompanyUser < Lobbyist::Base

    attr_accessor :company_user_id, :company_id, :date_added, :email, :first_name, :last_name,
      :is_active, :is_manager, :primary_contact, :accepts_terms, :sugar_contact_id

    def self.find(id)
      create_from_response(get("/v1/company_users/#{id}.json"))
    end
    
    def self.create(company_id, params = {})
      create_from_response(post("/v1/company_users.json", {'company_id' => company_id, 'company_user' => params}))
    end
    
    def self.update(id, company_id, params = {})
      create_from_response(put("/v1/company_users/#{id}.json", {'company_id' => company_id, 'company_user' => params}))
    end

    def self.destroy(id, company_id)
      create_from_response(delete("/v1/company_users/#{id}.json", {'company_id' => company_id}))
    end
  end
end
