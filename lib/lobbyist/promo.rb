module Lobbyist
  class Promo < Lobbyist::Base

    attr_accessor :promo_id, :account_level_id, :account_class, :promo_code, :promo_description, :is_current,
                  :is_visible, :setup_fee, :monthly_fee, :texting_grants, :first_month_fee, :split_activation_fee, :days_available,
                  :cost_per_postcard, :customer_count_lower_bound, :customer_count_upper_bound, :tax_exempt,
                  :text_credits, :postcard_credits, :overage_postcard_cost, :overage_postcard_cost

    def self.create(params = {})
      create_from_response(post('/v1/promos.json', { 'promo' => params }))
    end

    def self.list(params = {})
      create_from_response(get('/v1/promos.json', params))
    end

    def self.update(id, params = {})
      create_from_response(put("/v1/promos/#{id}.json", { 'promo' => params }))
    end

  end
end