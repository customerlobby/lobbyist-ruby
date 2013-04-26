module Lobbyist
  class MemberCalls < Lobbyist::Base
    
    attr_accessor :id, :company_id, :admin_user_id, :call_number, :completed_at, :status, :notes
    
    def initialize(attributes)
      attributes.each do |k,v|
        self.send "#{k}=", v
      end
    end
    
    def self.list(admin_user_id, params = {})
      params['admin_user_id'] = admin_user_id
      from_response(get('/v1/member_calls.json', params))
    end
    
    def self.find(id, params = {})
      from_response(get("/v1/member_calls/#{id}.json"), params)
    end
    
    def update()
      from_response(put("/v1/member_calls/#{id}.json", to_hash))
    end
    
    def delete()
      from_response(delete("/v1/member_calls/#{self.id}.json", to_hash))
    end

    protected
    
    def from_response(response)
      if response.is_a?(Array)
        list = []
        response.each do |element|
          list << self.new(element)
        end
        return list
      else
        self.new(element)
      end
    end
    
  end
end