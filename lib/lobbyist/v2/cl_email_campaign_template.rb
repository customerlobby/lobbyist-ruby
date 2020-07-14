# frozen_string_literal: true

module Lobbyist
  module V2
    class ClEmailCampaignTemplate < Lobbyist::V2::Base
      attr_accessor :id, :tag_id, :content, :unlayer_template_id, :status

      def self.list(params = {})
        create_collection_from_response(
          get('/v2/cl-email-campaign-templates.json', params)
        )
      end

      def self.find(id, params = {})
        create_from_response(
          get("/v2/cl-email-campaign-templates/#{id}.json", params)
        )
      end

      def self.create(params = {})
        create_from_response(
          post('/v2/cl-email-campaign-templates.json', cl_email_campaign_templates: params)
        )
      end

      def self.update(id, params = {})
        create_from_response(
          put("/v2/cl-email-campaign-templates/#{id}.json", cl_email_campaign_templates: params)
        )
      end

      def self.destroy(id)
        create_from_response(
          delete("/v2/cl-email-campaign-templates/#{id}.json")
        )
      end

      def self.category_assignment(params = {})
        create_collection_from_response(
          post('/v2/cl-email-campaign-templates/category-assignment.json', params)
        )
      end
    end
  end
end
