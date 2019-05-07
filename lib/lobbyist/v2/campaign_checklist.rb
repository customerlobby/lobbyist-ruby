module Lobbyist
  module V2
    class CampaignChecklist < Lobbyist::V2::Base
      attr_accessor :communication_campaign_id, :account_valid, :campaign_valid, :images_count, :credits_short
      attr_accessor :last_data_imported_at, :last_successful_transaction_at, :last_transaction_status, :mail_ready
      
      def self.update(campaign_id, params = {})
        create_from_response(put('/v2/campaign-checklists.json',
                                 { 'campaign_id' => campaign_id, 'campaign_checklist' => params }))
      end
    end
  end
end
