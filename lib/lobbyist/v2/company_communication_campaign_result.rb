module Lobbyist
  module V2
    class CompanyCommunicationCampaignResult < Lobbyist::V2::Base
      attr_accessor :overall_roi, :postcards_sent, :emails_sent, :responses, :response_rate, :completed, :in_progress
    end
  end
end
