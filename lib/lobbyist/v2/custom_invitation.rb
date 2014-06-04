module Lobbyist
  module V2

    class CustomInvitation < Lobbyist::V2::Base
      attr_accessor :contact_id, :company_id, :first_name, :last_name, :phone_daytime, :email
      attr_accessor :city, :state, :last_service_date, :created_at, :updated_at, :abbreviated_name
      attr_accessor :review_id, :review_status

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/custom_invitations.json", params))
      end

    end

  end
end
