module Lobbyist
  module V2

    class ScottySetting < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :days, :time
      attr_accessor :upload_type, :system_enabled, :use_closed_invoices, :access_token, :access_secret
      attr_accessor :access_data, :link_established, :last_run_date, :authentication_date, :importer_class_name
      attr_accessor :created_at, :updated_at, :account_name
      attr_accessor :connection_params, :connection_status, :connection_error_internal, :connection_error_external, :connection_notes
      attr_accessor :token_acquired_at, :fetch_frequency, :data_processing_enabled

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

