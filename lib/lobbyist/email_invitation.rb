module Lobbyist
  class EmailInvitation < Lobbyist::Base
    
    attr_accessor :id, :contact_id, :status, :attempts, :max_attempts, :created_at, :updated_at, :key, :accessed_at

    def company
      @company
    end
    
    def company=(attributes)
      @company = Company.new(attributes)
    end

    def contact
      @contact
    end
    
    def contact=(attributes)
      @contact = Contact.new(attributes)
    end
    
    def review
      @review
    end
    
    def review=(attributes)
      @review = Review.new(attributes)
    end
    
    def self.list(params = {})
      create_from_response(get('/v1/email_invitations.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/email_invitations/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/email_invitations.json", {'email_invitation' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/email_invitations/#{id}.json", {'email_invitation' => params}))
    end
    
    def self.find_by_email_key(email_key, params={})
      create_from_response(get("/v1/email_invitations/find_by_email_key/#{email_key}.json"))
    end

    # def self.destroy(id)
    #   create_from_response(delete("/v1/email_invitations/#{id}.json"))
    # end
    
  end
end
