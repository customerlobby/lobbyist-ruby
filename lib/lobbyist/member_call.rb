module Lobbyist
  class MemberCall < Lobbyist::Base
    
    def self.list(admin_user_id, params = {})
      params['admin_user_id'] = admin_user_id
      create_from_response(get('/v1/member_calls.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/member_calls/#{id}.json"))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/member_calls/#{id}.json", {'member_call' => params}))
    end
    
    def self.enqueue(id, admin_user_id)
      params = {'admin_user_id' => admin_user_id}
      create_from_response(put("/v1/member_calls/#{id}/enqueue.json", params))
    end

    def self.dequeue(id)
      create_from_response(put("/v1/member_calls/#{id}/dequeue.json"))
    end

  end
end