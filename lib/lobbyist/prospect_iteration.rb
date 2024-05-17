module Lobbyist
  class ProspectIteration < Lobbyist::Base

    attr_accessor :id, :prospect_campaign_id, :tracking_start_date, :tracking_end_date, :status
    attr_accessor :sent_count, :converted_contact_count, :call_records, :response_rate, :transaction_count

    def self.list(params = {})
      create_from_response(get('/v2/prospect_campaigns.json', params))
    end

  end
end
