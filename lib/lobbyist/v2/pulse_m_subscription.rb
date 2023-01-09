module Lobbyist
  module V2
    class PulseMSubscription < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :subscription_id, :reference, :account_level
      attr_accessor :status, :last_four, :expiration_date, :card_type
      attr_accessor :total_payments, :next_payment_date, :created_at, :updated_at
      attr_accessor :monthly_fee, :setup_fee, :employee_rewards, :contact_card, :twm
      attr_accessor :pulse_m_account_level_id, :pulse_m_promo_id

      def self.find_by_company_id(id)
        create_from_response(get("/v2/companies/#{id}/pulse-m-subscription.json"))
      end
    end
  end
end
