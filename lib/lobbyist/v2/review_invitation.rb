# frozen_string_literal: true

module Lobbyist
  module V2
    # Wrapper to v2/review_invitations apis
    class ReviewInvitation < Lobbyist::V2::Base
      attr_accessor :id, :contact_id, :uuid, :medium, :attempt_number,
                    :service_type, :service_id, :delivered, :opened,
                    :reviewed, :created_at, :updated_at, :destination

      def self.list(params = {})
        create_collection_from_response(get('/v2/review-invitations.json',
                                            params))
      end

      def self.find(uuid)
        create_from_response(get("/v2/review-invitations/#{uuid}.json"))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/review-invitations/#{id}.json",
                                 'review_invitation' => params))
      end
    end
  end
end
