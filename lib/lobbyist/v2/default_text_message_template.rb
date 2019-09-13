# frozen_string_literal: true

module Lobbyist
  module V2
    # Lobbyist endpoint for default-text-message-templates
    class DefaultTextMessageTemplate < Lobbyist::V2::HashieBase
      attr_accessor :id, :title, :message, :is_default
      attr_accessor :status, :created_at, :updated_at

      def self.list(params = {})
        create_response(get('/v2/default-text-message-templates.json', params))
      end
    end
  end
end
