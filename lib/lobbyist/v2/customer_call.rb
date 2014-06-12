module Lobbyist
  module V2

    class CustomerCall < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :contact_id, :customer_call_credit_id, :admin_user_id, :status
      attr_accessor :attempts, :notes, :last_call_date, :next_call_date, :completed_at
      attr_accessor :created_at, :updated_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/customer_calls.json", params))
      end
      
      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/customer_calls.json", {'customer_call' => params}))
      end

    end

  end
end
