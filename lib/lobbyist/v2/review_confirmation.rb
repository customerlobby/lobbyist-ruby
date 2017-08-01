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

      def self.update(id, company_id, params = {})
        pars = params.with_indifferent_access
        passed_params = {'disposition' => pars[:disposition], 'review_confirmation' => pars[:review_confirmation]}
        passed_params.merge!({'review' => pars[:review]}) if pars.has_key?(:review)
        passed_params.merge!({'contact' => pars[:contact]}) if pars.has_key?(:contact)
        passed_params.merge!({'contact_suggestions' => pars[:contact_suggestions]}) if pars.has_key?(:contact_suggestions)
        create_from_response(put("/v2/companies/#{company_id}/review_confirmations/#{id}.json", passed_params))
      end

      def self.find_by_confirmation_key(key, params = {})
        create_from_response(get("/v2/review_confirmations/find_by_confirmation_key/#{key}.json", params))
      end

    end

  end
end
