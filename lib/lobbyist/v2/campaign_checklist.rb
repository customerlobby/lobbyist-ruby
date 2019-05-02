module Lobbyist
  module V2
    class CampaignChecklist < Lobbyist::V2::Base
      attr_accessor :communication_campaign_id, :account_valid, :campaign_valid, :images_count, :credits_short
      attr_accessor :last_data_imported_at, :last_successful_transaction_at, :last_transaction_status, :mail_ready
      
      def self.calculate_readiness(campaign_id, params = {})
        create_from_response(get("/v2/campaign-checklist/#{campaign_id}/calculate-readiness.json", params))
      end
    end
  end
end
