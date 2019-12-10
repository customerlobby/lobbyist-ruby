# frozen_string_literal: true

module Lobbyist
  module V2
    class UrlConversion < HashieBase
      def self.create(params = {})
        create_response(post('/v2/url_conversions.json', params))
      end
    end
  end
end
