module Lobbyist
  module V2

    class SocialNetworkProfile < Lobbyist::V2::Base
      attr_accessor :id, :page_uid, :page_tab_company_id, :type, :category, :screen_name
      attr_accessor :access_token, :access_secret, :error_description, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/social-network-profiles.json", params))
      end

      def self.create(params = {})
        create_from_response(post("/v2/social-network-profiles.json", {social_network_profile: params}))
      end

      def self.update(profile_id, params = {})
        create_from_response(put("/v2/social-network-profiles/#{profile_id}.json", {social_network_profile: params}))
      end

      def self.reset_facebook(params = {})
        create_from_response(put("/v2/social-network-profiles/reset-facebook", params))
      end

    end

  end
end
