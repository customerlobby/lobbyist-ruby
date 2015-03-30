module Lobbyist
  class MemberCall < Lobbyist::Base
    attr_accessor :id, :company_id, :admin_user_id, :call_number, :completed_at
    attr_accessor :status, :priority, :notes, :created_at, :updated_at

    def self.list(params = {})
      create_collection_from_response(get('/v1/member_calls.json', params))
    end

    def self.call_counts_by_priority
      create_collection_from_response(get('/v1/member_calls/call_counts_by_priority.json'))
    end

    def self.filter(params={})
      create_collection_from_response(get('/v1/member_calls/filter.json', params))
    end

    def self.history(params={})
      create_collection_from_response(get('/v1/member_calls/history.json', params))
    end

    def self.find(id)
      create_from_response(get("/v1/member_calls/#{id}.json"))
    end

    def self.update(id, params = {})
      create_from_response(put("/v1/member_calls/#{id}.json", {'member_call' => params}))
    end

    def self.enqueue(id, admin_user_id)
      params = {'admin_user_id' => admin_user_id}
      create_from_response(put("/v1/member_calls/#{id}/enqueue.json", {'member_call' => params}))
    end

    def self.dequeue(id)
      create_from_response(put("/v1/member_calls/#{id}/dequeue.json"))
    end

  end
end
