module Lobbyist
  class Contact < Lobbyist::Base
    
    def self.find(id)
      create_from_response(get("/v1/contacts/#{id}.json"))
    end
    
    def self.create(company_id, params = {})
      create_from_response(post("/v1/contacts.json", {'company_id' => company_id, 'contact' => params}))
    end
    
    def self.update(company_id, id, params = {})
      create_from_response(put("/v1/contacts/#{id}.json", {'company_id' => company_id, 'contact' => params}))
    end

    def self.search(params = {})
      create_from_response(get("/v1/contacts/search.json", params))
    end
    
    def self.unsubscribe(params = {})
      create_from_response(put("/v1/contacts/unsubscribe.json", {'contact' => params}))
    end
  end
end
