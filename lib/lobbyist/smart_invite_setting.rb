module Lobbyist
  class SmartInviteSetting < Lobbyist::Base

    attr_accessor :id, :company_id, :enabled, :google_long_url, :google_short_url,
      :yelp_long_url, :yelp_short_url, :facebook_long_url, :facebook_short_url, :created_at, :updated_at
    attr_accessor :custom_display_name_1, :custom_long_url_1, :custom_short_url_1
    attr_accessor :custom_display_name_2, :custom_long_url_2, :custom_short_url_2
    attr_accessor :custom_display_name_3, :custom_long_url_3, :custom_short_url_3

  end
end
