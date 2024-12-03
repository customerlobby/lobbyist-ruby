module Lobbyist
  module V2
    class ProspectCall < Lobbyist::V2::Base

      attr_accessor :sid, :date_created, :to, :to_formatted, :from, :from_formatted, :phone_number_sid, :status,
                    :start_time, :end_time, :duration, :price, :price_unit, :direction, :forwarded_from

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/prospect_calls.json", params))
      end
    end
  end
end
