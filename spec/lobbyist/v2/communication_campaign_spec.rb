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

  describe "#create_branding_campaign" do
    it 'should return an instance' do
      VCR.use_cassette('v2/branding_campaign') do
        branding_campaign = Lobbyist::V2::CommunicationCampaign.create_branding_campaign(5565)
        expect(branding_campaign).to be_a(Lobbyist::V2::CommunicationCampaign)
        expect(branding_campaign).to_not be_nil
        expect(branding_campaign.name).to eq('Branding Campaign')
      end
    end
  end

  describe "#reset_branding_campaign" do
    it 'should return an instance' do
      VCR.use_cassette('v2/reset_branding_campaign') do
        # branding_campaign = Lobbyist::V2::CommunicationCampaign.create_branding_campaign(239)
        branding_campaign = Lobbyist::V2::CommunicationCampaign.reset_branding_campaign(5565)
        expect(branding_campaign).to be_a(Lobbyist::V2::CommunicationCampaign)
        expect(branding_campaign).to_not be_nil
        expect(branding_campaign.name).to eq('Branding Campaign')
      end
    end
  end
end
