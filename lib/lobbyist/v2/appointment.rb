module Lobbyist
  module V2

    class Appointment < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :name, :first_name, :last_name, :email, :phone, :appointment_date1, 
      :appointment_date2, :appointment_date3, :comments, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/appointments.json", params))
      end
    
      def self.find(id, company_id)
        create_from_response(get("/v2/appointments/#{id}.json"))
      end

      def self.update(id, company_id)
        create_from_response(put("/v2/appointments/#{id}.json"))
      end 
    end

  end
end