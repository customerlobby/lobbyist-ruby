# frozen_string_literal: true

module Lobbyist
  module V2
    # API wrapper for v2/reportd
    class Report < Lobbyist::V2::Base
      attr_accessor :url

      def self.campaign_analysis(params = {})
        create_from_response(get("/v2/reports/campaign-analysis.json", params))
      end
    end
  end
end
