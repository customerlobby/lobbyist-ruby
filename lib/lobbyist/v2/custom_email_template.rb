module Lobbyist
  module V2

    class CustomEmailTemplate < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :subject, :text_body, :keyword
      attr_accessor :from_email, :reply_email, :html_body, :status
      attr_accessor :greeting, :main_body, :signature, :auto_resend

      def self.list(company_id, params = {})
        create_collection_from_response(get("/v2/companies/#{company_id}/custom_email_templates.json", params))
      end

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/custom_email_templates.json", params))
      end

      def self.find(company_id, id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/custom_email_templates/#{id}.json", params))
      end

      def self.update(company_id, id, params)
        create_from_response(put("/v2/companies/#{company_id}/custom_email_templates/#{id}.json", params))
      end
    end

  end
end
