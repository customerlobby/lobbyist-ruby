module Lobbyist
  module V2
    class ProspectChecklist < Lobbyist::V2::Base
      attr_accessor :prospect_campaign_id, :account_valid, :campaign_valid, :images_count, :credits_short, :mail_ready

      def self.update(campaign_id, params = {})
        create_from_response(put('/v2/prospect-checklists.json',
                                 { 'campaign_id' => campaign_id, 'campaign_checklist' => params }))
      end
    end
  end
end
