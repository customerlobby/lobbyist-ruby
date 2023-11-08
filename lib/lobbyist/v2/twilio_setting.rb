module Lobbyist
  module V2
    class TwilioSetting < Lobbyist::V2::Base

      attr_accessor :id, :company_id, :phone, :phone_sid, :message_service_sid, :customer_profile_sid, :cpbi_sid,
                    :authorized_representative_sid, :address_sid, :supporting_document_sid, :trust_products_sid, :mpi_sid,
                    :brand_sid, :campaign_sid, :response, :created_at, :updated_at, :campaign_status

      def self.find(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/twilio_settings.json", params))
      end

      def self.fetch_campaign_status(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/twilio_settings/fetch_campaign_status.json", params))
      end
    end
  end
end
