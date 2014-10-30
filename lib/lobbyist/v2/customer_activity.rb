module Lobbyist
  module V2

    class CustomerActivity < Lobbyist::V2::Base
      attr_accessor :id, :contact_id, :event, :event_value, :entity_id, :entity_type, :created_at, :updated_at

      def self.list(company_id, customer_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/customers/#{customer_id}/customer_activities.json", params))
      end

    end

  end
end
