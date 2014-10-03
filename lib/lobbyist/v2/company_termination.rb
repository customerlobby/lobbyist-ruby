module Lobbyist
  module V2

    class CompanyTermination < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :company_name, :company_account_class, :admin_user_id, :status, :saved
      attr_accessor :pitch, :cancellation_channel, :projected_termination_date, :reason     
      attr_accessor :closed_at, :transaction_date, :created_at, :updated_at
      
      def self.list(params = {})
        create_collection_from_response(get("/v2/company_terminations.json", params))
      end
      
      def self.find(id)
        create_from_response(get("/v2/company_terminations/#{id}.json"))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/company_terminations/#{id}.json", {company_termination: params}))
      end

    end
  end
end
