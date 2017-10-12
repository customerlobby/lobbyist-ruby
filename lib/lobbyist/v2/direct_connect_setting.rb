module Lobbyist
  module V2
    class DirectConnectSetting < Lobbyist::V2::Base
      attr_accessor :company_id, :days, :time, :upload_type, :fetch_frequency, :data_processing_enabled,
                    :link_established, :access_token, :access_secret, :access_data, :access_data_1,
                    :ftp_password, :last_run_date, :authentication_date, :token_acquired_at, :system_enabled,
                    :use_closed_invoices, :importer_class_name, :fetcher_class_name, :mapper_class_name,
                    :account_name, :install_date, :connection_params, :connection_status, :connection_error_internal,
                    :connection_error_external, :connection_notes, :webhook_status, :last_webhook_received_at,
                    :split_mappings_updated, :name, :display_name, :version, :status, :visible, :database_name,
                    :access_type, :data_padding_enabled, :use_processor, :respect_commercial_flag,
                    :enable_auto_invitations, :requires_token_refresh, :supports_webhooks,
                    :supports_service_contracts
    end
  end
end
