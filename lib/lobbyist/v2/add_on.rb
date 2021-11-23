module Lobbyist
  module V2

    class AddOn < Lobbyist::V2::Base
      attr_accessor :id, :parentable_id, :parentable_type, :name, :short_name, :cost, :amount,
                    :status, :rollable, :start_date, :expiration_date

      def self.create(params = {})
        create_from_response(post('/v1/add_ons.json', { 'add_on' => params }))
      end

    end

  end
end