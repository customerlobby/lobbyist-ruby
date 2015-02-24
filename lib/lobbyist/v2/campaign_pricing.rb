module Lobbyist
  module V2
    class CampaignPricing
      attr_accessor :price, :max_price

      def self.find(company_id)
        create_from_response(get("/v2/companies/#{id}/campaign-pricing.json"))
      end
    end
  end
end
