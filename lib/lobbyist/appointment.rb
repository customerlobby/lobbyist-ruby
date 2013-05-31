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
    
    def self.find(company_id, id)
      create_from_response(get("/v1/appointments/#{id}.json", { 'company_id' => "#{company_id}" }))
    end
    
    def self.create(company_id, params = {})
      send_params = { 'company_id' => "#{company_id}", 'appointment' => params }
      create_from_response(post("/v1/appointments.json", send_params))
    end
    
    def self.destroy(id)
      create_from_response(delete("/v1/appointments/#{id}.json"))
    end
    
  end
end