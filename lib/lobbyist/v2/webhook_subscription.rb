# frozen_string_literal: true

module Lobbyist
  module V2
    # WebhookSubscription
    class WebhookSubscription < Lobbyist::V2::HashieBase
      attr_accessor :data

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/company/#{company_id}/webhook-subscriptions.json", params))
      end

      def self.update(company_id, id, params = {})
        response = put("/v2/company/#{company_id}/webhook-subscriptions/#{id}.json", webhook_subscription: params)
        create_response(response)
      end

      def self.find(company_id, id = nil)
        response = get("/v2/company/#{company_id}/webhook-subscriptions/#{id}.json")
        create_response(response)
      end

      def self.create(company_id, params = {})
        create_response(post("/v2/company/#{company_id}/webhook-subscriptions.json", webhook_subscription: params))
      end

      def self.destroy(company_id, id = nil)
        create_response(delete("/v2/company/#{company_id}/webhook-subscriptions/#{id}.json"))
      end
    end
  end
end
