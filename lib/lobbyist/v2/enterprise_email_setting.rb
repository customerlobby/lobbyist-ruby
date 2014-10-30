module Lobbyist
  module V2

    class EnterpriseEmailSetting < Lobbyist::V2::Base
      attr_accessor :id, :enterprise_id, :category, :deliver_to, :alternate_address, :created_at, :updated_at

      def self.list(enterprise_id, params = {})
        create_collection_from_response(get("/v2/enterprises/#{enterprise_id}/enterprise_email_settings.json", params))
      end
      
      def self.update(enterprise_id, id, params)
        create_from_response(put("/v2/enterprises/#{enterprise_id}/enterprise_email_settings/#{id}.json", {enterprise_email_setting: params}))
      end
    end

  end
end
