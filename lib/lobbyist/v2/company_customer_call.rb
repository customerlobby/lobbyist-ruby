module Lobbyist
  module V2
    class CompanyCustomerCall < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :contact_id, :customer_call_credit_id, :admin_user_id, :status
      attr_accessor :attempts, :notes, :last_call_date, :next_call_date, :completed_at
      attr_accessor :created_at, :updated_at
      attr_accessor :email, :phone_alt, :phone_mobile, :phone_daytime, :full_name, :admin_name

      def self.list(params = {})
        create_collection_from_response(get("/v2/company_customer_calls.json", params))
      end

      def self.search(params = {})
        create_collection_from_response(get('/v2/company_customer_calls/search.json', params))
      end

      def self.find(id)
        create_from_response(get("/v2/company_customer_calls/#{id}.json"))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/company_customer_calls.json", {'company_id' => company_id, 'customer_call' => params}))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/company_customer_calls/#{id}.json", {'customer_call' => params}))
      end

      def self.destroy(id)
        create_from_response(delete("/v2/company_customer_calls/#{id}.json"))
      end
    end
  end
end
