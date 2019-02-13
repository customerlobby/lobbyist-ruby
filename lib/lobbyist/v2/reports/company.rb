# frozen_string_literal: true

module Lobbyist
  module V2
    module Reports
      # API wrapper for v2/reports/companies
      class Company < Lobbyist::V2::Base
        attr_accessor :url

        def self.campaign_analysis(company_id, params = {})
          create_from_response(get("/v2/reports/companies/#{company_id}/campaign-analysis.json", params))
        end
      end
    end
  end
end
