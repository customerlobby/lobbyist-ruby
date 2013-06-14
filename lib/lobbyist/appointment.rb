module Lobbyist
  class Appointment < Lobbyist::Base
    
    attr_accessor :id, :company_id, :first_name, :last_name, :email, :phone, :appointment_date1,
      :appointment_date2, :appointment_date3, :comments, :created_at, :updated_at
    
    def company
      @company
    end
    
    def company=(attributes)
      @company = Company.new(attributes)
    end
    
    def self.list(params = {})
      create_from_response(get('/v1/appointments.json', params))
    end
    
    def self.find(id)
      create_from_response(get("/v1/appointments/#{id}.json"))
    end
    
    def self.create(params = {})
      create_from_response(post("/v1/appointments.json", {'appointment' => params}))
    end
    
  end
end