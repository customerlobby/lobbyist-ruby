module Lobbyist
  module V2

    class SmartInviteSetting < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :enabled, :google_long_url, :google_short_url, :gmail_only
      attr_accessor :yelp_long_url, :yelp_short_url
      attr_accessor :created_at, :updated_at, :angies_list_active, :angies_list_long_url, :angies_list_short_url
      attr_accessor :facebook_long_url, :facebook_short_url
      attr_accessor :custom_display_name_1, :custom_long_url_1, :custom_short_url_1
      attr_accessor :custom_display_name_2, :custom_long_url_2, :custom_short_url_2
      attr_accessor :custom_display_name_3, :custom_long_url_3, :custom_short_url_3
      attr_accessor :google_access_token, :google_refresh_token, :google_connection_status

      def self.update(company_id, params)
        create_from_response(put("/v2/companies/#{company_id}/smart_invite_settings.json", {smart_invite_setting: params}))
      end
    end

  end
end
