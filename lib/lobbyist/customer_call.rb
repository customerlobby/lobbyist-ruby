module Lobbyist
  class CustomerCall < Lobbyist::Base
    
    # Meta information
    attr_accessor :count
    
    # Attributes
    attr_accessor :id, :company_id, :contact_id, :customer_call_credit_id, :admin_user_id,
      :status, :attempts, :notes, :last_call_date, :next_call_date, :completed_at, :created_at, :updated_at
    
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
  
    def self.list(params = {})
      create_from_response(get('/v1/customer_calls.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/customer_calls/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(put("/v1/customer_calls.json", {'customer_call' => params}))
    end
    
    def self.update(id, params = {})
      create_from_response(put("/v1/customer_calls/#{id}.json", {'customer_call' => params}))
    end
    
    def self.enqueue(id, admin_user_id)
      params = {'admin_user_id' => admin_user_id}
      create_from_response(put("/v1/customer_calls/#{id}/enqueue.json", params))
    end

    def self.dequeue(id)
      create_from_response(put("/v1/customer_calls/#{id}/dequeue.json"))
    end

  end
end