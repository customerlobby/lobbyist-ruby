module Lobbyist
  module V2

    class HandwrittenReviewMetrics < Lobbyist::V2::Base
      attr_accessor :available, :used, :next_grant_date, :monthly_data

      def self.find_by_company(company_id)
        create_from_response(get("/v2/companies/#{company_id}/handwritten_review_metrics.json"))
      end
 
    end

  end
end