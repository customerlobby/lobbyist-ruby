module Lobbyist
  module V2

    class SocialNetworkPage < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :social_network_profile_id, :status, :created_at, :updated_at

      def self.update(company_id, page_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/social_network_pages/#{page_id}.json", params))
      end
    end

  end
end
