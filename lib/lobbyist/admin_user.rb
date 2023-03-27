module Lobbyist
  class AdminUser < Lobbyist::Base
    attr_accessor :admin_user_id, :email, :first_name, :last_name, :password, :is_total_admin, 
    :is_active, :screen_name, :sales_team_id, :created_at, :updated_at, :auth_key, :persistence_token, :old_role, :employment_type,
    :role_name, :role_id

    def self.list(params = {})
      create_collection_from_response(get('/v1/admin_users.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/admin_users/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/admin_users.json", {'admin_user' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/admin_users/#{id}.json", {'admin_user' => params}))
    end
    
    def self.destroy(id)
      create_from_response(delete("/v1/admin_users/#{id}.json"))
    end

  end
end