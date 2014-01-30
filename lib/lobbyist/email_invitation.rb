module Lobbyist
  class EmailInvitation < Lobbyist::Base
    attr_accessor :id, :contact_id, :status, :old_invite_id, :attempts, :max_attempts
    attr_accessor :created_at, :updated_at, :email_key, :accessed_at

    def self.list(params = {})
      create_collection_from_response(get('/v1/email_invitations.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/email_invitations/#{id}.json"))
    end
    
    def self.create(company_id, params = {})
      create_from_response(post("/v1/email_invitations.json", {'company_id' => company_id, 'email_invitation' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/email_invitations/#{id}.json", {'email_invitation' => params}))
    end
    
    def self.find_by_email_key(email_key, params={})
      create_from_response(get("/v1/email_invitations/find_by_email_key/#{email_key}.json"))
    end
  end
end
