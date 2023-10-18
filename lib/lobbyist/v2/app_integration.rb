module Lobbyist
  module V2
    class AppIntegration < Lobbyist::V2::Base
      attr_accessor :id, :default_app_integration_id, :company_id, :status, :meta_data

      def self.find_gq_settings(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/gq_settings.json", params))
      end

      def self.update_gq_settings(company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/update_gq_settings.json", params))
      end

    end
  end
end
