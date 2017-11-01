require 'spec_helper'

describe Lobbyist::V2::DirectConnectEvent, customer_call: true do
  describe '#create_dc_event' do
    it 'create direct connect event' do
      VCR.use_cassette('v2/dc_event') do
        results = Lobbyist::V2::DirectConnectEvent.create({
                                                              'company_id' => 5565,
                                                              'event' => 'collection_in_progress',
                                                              'payload' => {
                                                                  'current_step' => 'collection',
                                                                  'next_step' => 'processing',
                                                                  'progress' => 60
                                                              }
                                                          })
        expect(results).to be_a(Lobbyist::V2::DirectConnectEvent)
      end
    end
  end
end