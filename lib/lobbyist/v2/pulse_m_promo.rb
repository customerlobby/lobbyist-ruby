module Lobbyist
  module V2

    class PulseMPromo < Lobbyist::V2::Base
      attr_accessor :id, :account_level, :code, :description, :active, :expires_at, :setup_fee
      attr_accessor :setup_fee, :monthly_fee, :employee_rewards, :contact_card, :twm, :technician_count
      attr_accessor :pulse_m_account_level_id

      def self.list(params = {})
        create_collection_from_response(get("/v2/pulse_m_promos.json", params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/pulse_m_promos/#{id}.json", params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/pulse_m_promos/#{id}.json", params))
      end

      def self.create(params = {})
        create_from_response(post("/v2/pulse_m_promos.json", params))
      end
    end

  end
end
