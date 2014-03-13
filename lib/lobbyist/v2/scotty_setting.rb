module Lobbyist
  module V2

    class ScottySetting < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :days, :time
      attr_accessor :upload_type, :statue, :system_enabled, :access_token, :access_secret
      attr_accessor :access_data, :link_established, :last_run_date, :authentication_date, :importer_class_name
      attr_accessor :created_at, :updated_at

      def self.create(params)
        create_from_response(post("/v2/scotty_settings.json", {scotty_setting: params}))
      end
      
      def self.update(id, params)
        create_from_response(put("/v2/scotty_settings/#{id}.json", {scotty_setting: params}))
      end

      def self.destroy(id)
        create_from_response(delete("/v2/scotty_settings/#{id}.json"))
      end
    end

  end
end

