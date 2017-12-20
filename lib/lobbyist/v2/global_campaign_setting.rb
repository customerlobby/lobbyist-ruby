module Lobbyist
  module V2

    class GlobalCampaignSetting < Lobbyist::V2::Base
      attr_accessor :company_id, :logo_filename, :tag_line, :regulatory_info, :review_type
      attr_accessor :email_first_name, :email_last_name, :email, :approved 

      def self.list(params = {})
        create_collection_from_response(get("/v2/global_campaign_settings.json", params))
      end

      def self.find_by_company(company_id, params = {})
        create_from_response(get("/v2/global_campaign_settings/find-by-company/#{company_id}.json", params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/global_campaign_settings/#{id}.json", params))
      end
    end

  end
end
