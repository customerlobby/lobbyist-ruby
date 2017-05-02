module Lobbyist
  module V2

    class SmartInviteSetting < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :enabled, :google_long_url, :google_short_url
      attr_accessor :yelp_long_url, :yelp_short_url
      attr_accessor :created_at, :updated_at, :angies_list_active, :angies_list_long_url, :angies_list_short_url
      attr_accessor :facebook_long_url, :facebook_short_url
      attr_accessor :custom_display_name_1, :custom_long_url_1, :custom_short_url_1
      attr_accessor :custom_display_name_2, :custom_long_url_2, :custom_short_url_2
      attr_accessor :custom_display_name_3, :custom_long_url_3, :custom_short_url_3

      def self.check_invalid_long_urls(obj, params)
        urls = []
        check_urls = {
          google_long_url: "Google",
          yelp_long_url: "Yelp",
          angies_list_long_url: "Angie's List",
          facebook_long_url: "Facebook",
          custom_long_url_1: "Custom-1",
          custom_long_url_2: "Custom-2",
          custom_long_url_3: "Custom-3",
        }.each do |key, msg|
          valNew = obj.send(key) || ''
          valOld = params[key.to_s]
          urls << msg if valOld && valNew != valOld
        end
        raise "Some urls are invalid: #{urls.join(", ")}" unless urls.empty?
      end

      def self.update(company_id, params)
        res = create_from_response(put("/v2/companies/#{company_id}/smart_invite_settings.json", {smart_invite_setting: params}))
        check_invalid_long_urls(res, params)
        res
      end
    end

  end
end
