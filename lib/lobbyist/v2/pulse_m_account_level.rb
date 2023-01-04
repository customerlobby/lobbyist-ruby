module Lobbyist
  module V2

    class PulseMAccountLevel < Lobbyist::V2::Base
      attr_accessor :id, :name, :description, :enabled, :visible, :technician_count
      attr_accessor :setup_fee, :monthly_fee, :employee_rewards, :contact_card, :twm

      def self.list(params = {})
        create_collection_from_response(get("/v2/pulse_m_account_levels.json", params))
      end
    end

  end
end
