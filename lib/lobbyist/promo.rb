module Lobbyist
  class Promo < Lobbyist::Base
    
    attr_accessor :promo_id, :account_level_id, :account_class, :promo_code, :promo_description, :is_current, :is_visible, :setup_fee, :monthly_fee, 
    :first_month_fee, :split_activation_fee, :days_available
    
    def account_level
      @account_level
    end
    
    def account_level=(attributes)
      @account_level = AccountLevel.new(attributes)
    end

    def self.create(params = {})
      create_from_response(post("/v1/promos.json", {'promo' => params}))
    end
    
    def self.list(params = {})
      create_from_response(get('/v1/promos.json', params))
    end
    
    def self.discontinue(promo_id)
      create_from_response(put("/v1/promos/#{promo_id}/discontinue.json"))
    end
    
  end
end