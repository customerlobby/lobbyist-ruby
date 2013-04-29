module Lobbyist
  class MemberCall < Lobbyist::Base
    
    attr_accessor :id, :company_id, :admin_user_id, :call_number, :completed_at, :status, :notes, :created_at, :updated_at
    
    def initialize(attributes)
      attributes.each do |k,v|
        self.send "#{k}=", v
      end
    end
    
    def self.list(admin_user_id, params = {})
      params['admin_user_id'] = admin_user_id
      from_response(get('/v1/member_calls.json', params))
    end
    
    def self.find(id)
      from_response(get("/v1/member_calls/#{id}.json"))
    end
    
    def update()
      self.class.from_response(self.class.put("/v1/member_calls/#{id}.json", {'member_call' => to_hash}))
    end
    
    def enqueue(admin_user_id)
      params = {'admin_user_id' => admin_user_id}
      self.class.from_response(self.class.put("/v1/member_calls/#{id}/enqueue.json", params))
    end

    def dequeue()
      self.class.from_response(self.class.put("/v1/member_calls/#{id}/dequeue.json"))
    end
    
    protected
    
    def self.from_response(response)
      if response.is_a?(Array)
        list = []
        response.each do |element|
          list << self.new(element)
        end
        return list
      else
        self.new(response)
      end
    end
    
  end
end