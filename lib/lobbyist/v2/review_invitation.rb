module Lobbyist
  module V2

    class ReviewInvitation < Lobbyist::V2::Base

      attr_accessor :id, :contact_id, :uuid, :medium, :attempt_number, :service_typ, :service_id,
        :attempt_number, :delivered, :opened, :reviewed, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/review-invitations.json", params))
      end

      def self.find(id)
        create_from_response(get("/v2/review-invitations/#{id}.json"))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/review-invitations/#{id}.json", {'review_invitation' => params}))
      end
    end
  end
end

