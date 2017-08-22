module Lobbyist
  module V2

    class SocialNetworkPage < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :social_network_profile_id, :status, :error_message, :created_at, :updated_at

      def self.create(params = {})
        create_from_response(post("/v2/social-network-pages.json", {social_network_page: params}))
      end

      def self.update(page_id, params = {})
        create_from_response(put("/v2/social-network-pages/#{page_id}.json", params))
      end
    end

  end
end
