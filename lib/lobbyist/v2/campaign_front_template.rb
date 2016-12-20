module Lobbyist
  module V2

    class CampaignFrontTemplate < Lobbyist::V2::Base
      attr_accessor :id, :communication_campaign_id, :company_id, :image_filename, :message_position, :content, :image_resize_status
      attr_accessor :custom_image, :created_at, :updated_at, :selected

      def self.list(campaign_id, params = {})
        create_collection_from_response(get("/v2/campaigns/#{campaign_id}/front-templates.json", params))
      end

    end

  end
end
