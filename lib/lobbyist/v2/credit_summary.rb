module Lobbyist
  module V2
    # This class is used for any endpoints that display a credit summary
    class CreditSummary < Lobbyist::V2::Base
      attr_accessor :credit_balance, :approved_credits, :in_progress_credits, :pending_credits
    end
  end
end