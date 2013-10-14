module Lobbyist
  class CustomerCall < Lobbyist::Base
    
    def self.list(params = {})
      create_collection_from_response(get('/v1/customer_calls.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/customer_calls/#{id}.json"))
    end
    
    def self.create(company_id, params = {})
      create_from_response(post("/v1/customer_calls.json", {'company_id' => comapny_id, 'customer_call' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/customer_calls/#{id}.json", {'customer_call' => params}))
    end
    
    def self.enqueue(id, admin_user_id)
      params = {'admin_user_id' => admin_user_id}
      create_from_response(put("/v1/customer_calls/#{id}/enqueue.json", {'customer_call' => params}))
    end

    def self.dequeue(id)
      create_from_response(put("/v1/customer_calls/#{id}/dequeue.json"))
    end

  end
end