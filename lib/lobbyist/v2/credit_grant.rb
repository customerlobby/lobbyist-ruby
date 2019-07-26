# frozen_string_literal: true

module Lobbyist
  module V2
    # Class for getting credit_grants
    class CreditGrant < Lobbyist::V2::Base
      attr_accessor :company_id, :cost, :grant_type, :granter_id, :granter_type
      attr_accessor :status, :expired, :category, :created_at, :updated_at
      attr_accessor :credit_amount, :total_amount

      def self.summary(company_id)
        create_collection_from_response(
            get("/v2/companies/#{company_id}/credit_grants/summary.json")
        )
      end

      def self.texting_summary(company_id)
        create_from_response(
            get("/v2/companies/#{company_id}/credit_grants/texting-summary.json")
        )
      end
    end

  end
end
