# frozen_string_literal: true

module Lobbyist
  module V2
    class InheritableCampaignCompany < Lobbyist::V2::Base
      attr_accessor :id, :parent_id, :child_id, :parent_company_name, :child_company_name, :enabled, :created_at

      class << self
        def list(params = {})
          create_collection_from_response(get("/v2/inheritable_campaign_companies.json", params))
        end

        def toggle(id, params= {})
          create_from_response(put("/v2/inheritable_campaign_companies/#{id}/toggle_status.json", params))
        end

        def candidate_companies(params = {})
          create_collection_from_response(get("/v2/inheritable_campaign_companies/candidate_companies.json", params))
        end

        def create(params = {})
          create_from_response(post('/v2/inheritable_campaign_companies.json', params))
        end
      end
    end
  end
end
