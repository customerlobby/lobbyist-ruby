module Lobbyist
  module V2

    class Promo < Lobbyist::V2::Base

      attr_accessor :promo_id, :account_level_id, :account_class, :promo_code
      attr_accessor :promo_description, :is_current, :is_visible, :setup_fee
      attr_accessor :monthly_fee, :texting_grants, :first_month_fee
      attr_accessor :split_activation_fee, :days_available, :cost_per_postcard
      attr_accessor :text_credits, :postcard_credits, :overage_postcard_cost, :overage_postcard_cost

    end

  end
end