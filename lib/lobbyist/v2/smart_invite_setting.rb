module Lobbyist
  module V2

    class SmartInviteSetting < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :enabled, :google_long_url, :google_short_url
      attr_accessor :yahoo_long_url, :yahoo_short_url, :yelp_long_url, :yelp_short_url
      attr_accessor :created_at, :updated_at, :angies_list_active, :angies_list_long_url, :angies_list_short_url

      def self.update(company_id, params)
        create_from_response(put("/v2/companies/#{company_id}/smart_invite_settings.json", {smart_invite_setting: params}))
      end
    end

  end
end

