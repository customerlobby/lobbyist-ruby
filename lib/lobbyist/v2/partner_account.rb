module Lobbyist
  module V2

    class PartnerAccount < Lobbyist::V2::Base
      attr_accessor :id, :partner_id, :company_id, :name, :creation_date, :termination_date 
      attr_accessor :address1, :address2, :city, :state, :zip, :phone, :website, :country
      attr_accessor :internal_id

      
      def self.update(id, params)
        create_from_response(put("/v2/partner_accounts/#{id}.json", {partner_account: params}))
      end
      
      def self.find(id)
        create_from_response(get("/v2/partner_accounts/#{id}.json"))
      end

    end

  end
end
