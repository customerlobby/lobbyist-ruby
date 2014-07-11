module Lobbyist
  module V2

    class SocialNetworkProfile < Lobbyist::V2::Base
      attr_accessor :id, :page_uid, :page_tab_company_id, :type, :category, :screen_name
      attr_accessor :access_token, :access_secret, :error_description, :created_at, :updated_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/social_network_profiles.json", params))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/social_network_profiles.json", {social_network_profile: params}))
      end

      def self.update(company_id, profile_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/social_network_profiles/#{profile_id}.json", {social_network_profile: params}))
      end
    end

  end
end
