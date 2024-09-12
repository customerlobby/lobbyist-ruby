module Lobbyist
  class Promo < Lobbyist::Base

    attr_accessor :promo_id, :account_level_id, :account_class, :promo_code, :promo_description,
                  :is_current, :is_visible, :setup_fee, :monthly_fee, :texting_grants,
                  :first_month_fee, :split_activation_fee, :days_available,
                  :cost_per_postcard, :customer_count_lower_bound, :customer_count_upper_bound,
                  :tax_exempt, :email_grants, :add_ons, :email_add_ons, :prospect_add_ons,
                  :cost_per_magnet_mailer, :prospect_marketing

    def self.create(params = {})
      create_from_response(post('/v1/promos.json', { 'promo' => params }))
    end

    def self.list(params = {})
      create_from_response(get('/v1/promos.json', params))
    end

    def self.update(id, params = {})
      create_from_response(put("/v1/promos/#{id}.json", { 'promo' => params }))
    end


    def self.show(id, params = {})
      create_from_response(get("/v1/promos/#{id}.json"))
    end
  end
end