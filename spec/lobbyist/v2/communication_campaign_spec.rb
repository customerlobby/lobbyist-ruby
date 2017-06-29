require 'spec_helper'

describe Lobbyist::V2::CommunicationCampaign, customer_call: true do
  describe "#create" do
    it 'should return an instance' do
      VCR.use_cassette('v2/communication_campaigns_results') do
        results = Lobbyist::V2::CommunicationCampaign.results(3, company_id: 5565)
        expect(results).to be_a(Lobbyist::V2::CommunicationCampaign)
      end
    end
  end
end
