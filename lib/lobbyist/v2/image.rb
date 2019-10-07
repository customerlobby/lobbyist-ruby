# frozen_string_literal: true

module Lobbyist
  module V2
    # class to handle image apis
    class Image < HashieBase
      def self.list(params = {})
        create_response(get('/v2/images.json', params))
      end

      def self.create(params = {})
        create_response(post('/v2/images.json', { image: params }, true))
      end

      def self.update_selected(params = {})
        create_response(put('/v2/images.json', params))
      end
    end
  end
end
