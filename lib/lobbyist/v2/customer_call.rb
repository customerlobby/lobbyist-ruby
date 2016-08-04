module Lobbyist
  module V2
    class CustomerCall < Lobbyist::Base
      attr_accessor :id, :company_id, :contact_id, :customer_call_credit_id, :admin_user_id
      attr_accessor :status, :attempts, :notes, :last_call_date, :next_call_date
      attr_accessor :completed_at, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get('/v2/customer_calls.json', params))
      end

      def self.find(id)
        create_from_response(get("/v2/customer_calls/#{id}.json"))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/customer_calls.json", {'company_id' => comapny_id, 'customer_call' => params}))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/customer_calls/#{id}.json", {'customer_call' => params}))
      end

      def self.enqueue(id, admin_user_id)
        params = {'admin_user_id' => admin_user_id}
        create_from_response(put("/v2/customer_calls/#{id}/enqueue.json", {'customer_call' => params}))
      end

      def self.dequeue(id)
        create_from_response(put("/v2/customer_calls/#{id}/dequeue.json"))
      end

    end
  end
end
