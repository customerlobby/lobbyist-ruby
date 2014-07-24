module Lobbyist
  module V2

    class CustomerMetrics < Lobbyist::V2::Base

      attr_accessor :count, :email_count, :phone_count, :address_count, :visible_count , 
        :email_invitation_candidates, :customer_call_candidates

      def self.list(company_id)
        create_from_response(get("/v2/companies/#{company_id}/customer_metrics.json"))
      end
      
    end

  end
end
