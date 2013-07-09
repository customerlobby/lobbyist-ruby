module Lobbyist
  class AccountLevel < Lobbyist::Base
    
    attr_accessor :account_class_id, :account_class, :description, :call_credit_cost, :default_promo_id, :enabled, :monthly_call_credit_allowance,
    :ccall_credits_accumulate, :monthly_handwritten_credit_allowance, :handwritten_credits_accumulate, :conversion_handwritten_credit_grant, :conversion_ccall_credit_grant
      
    def default_promo
      @default_promo
    end
    
    def default_promo=(attributes)
      @default_promo = Promo.new(attributes)
    end  
     
    def self.list(params = {})
      create_from_response(get('/v1/account_levels.json', params))
    end
    
  end
end