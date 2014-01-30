module Lobbyist
  module V2

    class EnterpriseSetting < Lobbyist::V2::Base
      attr_accessor :id, :enterprise_id, :location_license_fee, :location_activation_fee
      attr_accessor :location_termination_fee, :creation_fee, :reactivation_fee, :termination_fee
      attr_accessor :misc_fee, :billing_email, :created_at, :updated_at

      def self.show(id, params = {})
        create_from_response(get("/v2/enterprise_settings/#{id}.json", params))
      end
      
      def self.update(id, params)
        create_from_response(put("/v2/enterprise_settings/#{id}.json", {enterprise: params}))
      end
    end

  end
end
