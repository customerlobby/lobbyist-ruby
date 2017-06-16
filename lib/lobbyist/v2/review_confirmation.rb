module Lobbyist
  module V2

    class ReviewConfirmation < Lobbyist::V2::Base
      attr_accessor :id, :review_id, :confirmation_type, :attempts, :max_attempts, :status
      attr_accessor :from_phone_number, :to_phone_number, :from_ip_address, :delivered_at, :created_at, :updated_at

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/review_confirmations.json", params))
      end

      def self.reset(id, company_id, params = {})
        create_from_response(put("/v2/companies/#{company_id}/review_confirmations/#{id}/reset.json", {contact: params}))
      end

      def self.find_by_confirmation_key(key, params = {})
        create_from_response(get("/v2/review_confirmations/find_by_confirmation_key/#{key}.json", params))
      end

    end

  end
end
