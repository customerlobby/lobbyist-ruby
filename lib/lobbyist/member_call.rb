module Lobbyist
  class MemberCall < Lobbyist::Base
    
    attr_accessor :id, :company_id, :admin_user_id, :call_number, :completed_at, :status, :notes, :created_at, :updated_at
    
    def self.list(admin_user_id, params = {})
      params['admin_user_id'] = admin_user_id
      create_from_response(get('/v1/member_calls.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/member_calls/#{id}.json"))
    end
    
    def update()
      self.class.create_from_response(self.class.put("/v1/member_calls/#{id}.json", {'member_call' => to_params}))
    end
    
    def enqueue(admin_user_id)
      params = {'admin_user_id' => admin_user_id}
      self.class.create_from_response(self.class.put("/v1/member_calls/#{id}/enqueue.json", params))
    end

    def dequeue()
      self.class.create_from_response(self.class.put("/v1/member_calls/#{id}/dequeue.json"))
    end

    def to_params
      {
        'company_id'    => self.company_id.to_s,
        'admin_user_id' => self.admin_user_id.to_s,
        'call_number'   => self.call_number.to_s,
        'completed_at'  => self.completed_at.to_s,
        'status'        => self.status.to_s,
        'notes'         => self.notes.to_s
      }
    end
    
  end
end