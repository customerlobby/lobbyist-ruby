module Lobbyist
  module V2
    class CompanyFeatureFlag < Lobbyist::V2::Base
      attr_accessor :id, :component, :operation, :parent_id, :enabled, :updated_at

      class << self
        def list(company_id, params = {})
          create_collection_from_response(get("/v2/companies/#{company_id}/company_feature_flags.json", params))
        end

        def update(company_id, params = {})
          create_collection_from_response(put("/v2/companies/#{company_id}/company_feature_flags.json", params))
        end
      end
    end
  end
end
