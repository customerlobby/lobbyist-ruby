module Lobbyist
  module V2
    class Zipcode < Lobbyist::V2::HashieBase
      attr_accessor :zipcode, :customer_count

      def self.list(params = {})
        create_response(get('/v2/zipcodes.json', params))
      end
    end
  end
end
