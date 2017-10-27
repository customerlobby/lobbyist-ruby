module Lobbyist
  module V2
    class DirectConnectEvent < Lobbyist::V2::Base
      attr_accessor :current_step, :next_step, :progress

      def self.create(params = {})
        create_from_response(post('/v2/direct_connect_events.json', params))
      end
    end
  end
end
