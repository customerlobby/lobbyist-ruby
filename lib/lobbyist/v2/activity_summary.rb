# frozen_string_literal: true

module Lobbyist
  module V2
    class ActivitySummary < Lobbyist::V2::Base
      attr_accessor :email_invitation_sent, :customer_call_requested
    end
  end
end
