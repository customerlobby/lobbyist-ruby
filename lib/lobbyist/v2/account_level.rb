module Lobbyist
  module V2

    class AccountLevel < Lobbyist::V2::Base
      attr_accessor :account_class_id, :account_class, :description, :call_credit_cost, :default_promo_id
      attr_accessor :enabled, :monthly_call_credit_allowance, :ccall_credits_accumulate
      attr_accessor :monthly_handwritten_credit_allowance, :handwritten_credits_accumulate
      attr_accessor :conversion_handwritten_credit_grant, :conversion_ccall_credit_grant
      attr_accessor :paid, :rank, :created_at, :updated_at, :monthly_fee, :setup_fee, :cost_per_postcard
      attr_accessor :customer_count_lower_bound, :customer_count_upper_bound, :has_review_reminders
      attr_accessor :has_contact_reminders, :has_member_calls, :has_kiosk, :has_customer_calls
      attr_accessor :has_handwritten_reviews, :supported, :visible, :internal, :requires_button, :campaign_enabled

      def self.list(params = {})
        create_collection_from_response(get("/v2/account_levels.json", params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/account_levels/#{id}.json", params))
      end

    end

  end
end
