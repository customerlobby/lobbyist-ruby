module Lobbyist
  class SocialNetworkProfile < Lobbyist::Base

    attr_accessor :id, :page_uid, :page_tab_company_id, :type, :category, :screen_name,
      :access_token, :access_secret, :error_description, :created_at, :updated_at

    def self.search(params = {})
      create_from_response(get("/v1/social_network_profiles/search.json", params))
    end
  end
end