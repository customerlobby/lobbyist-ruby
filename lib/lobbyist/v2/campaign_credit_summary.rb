module Lobbyist
  module V2
    class CampaignCreditSummary < Lobbyist::V2::Base
      attr_accessor :credit_balance, :approved_credits, :in_progress_credits, :pending_credits
    end
  end
end