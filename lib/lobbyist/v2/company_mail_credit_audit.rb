module Lobbyist
  module V2
    class CompanyMailCreditAudit < Lobbyist::V2::Base

      attr_accessor :id, :company_id, :event, :owner_id, :owner_type, :amount

      def self.create(company_id, params = {})
        create_from_response(post("/v2/companies/#{company_id}/company_mail_credit_audits.json", params))
      end
      
    end
  end
end
