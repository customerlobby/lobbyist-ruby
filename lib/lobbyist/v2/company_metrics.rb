module Lobbyist
  module V2

    class CompanyMetrics < Lobbyist::V2::Base

      def self.list(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/company_metrics.json", params))
      end
      
    end

  end
end
