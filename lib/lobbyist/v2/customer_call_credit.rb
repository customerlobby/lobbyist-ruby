module Lobbyist
  module V2

    class CustomerCallCredit < Lobbyist::V2::Base

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/customer_call_credits.json", params))
      end
      
    end

  end
end
