require 'spec_helper'

describe Lobbyist::V2::SupportedCampaigns do
  describe "#list" do
    it 'list all supported_campaigns' do
      VCR.use_cassette('v2/supported_campaigns') do
        result = Lobbyist::V2::SupportedCampaigns.list(company_id: 239)
        p result.to_s
        expect(result).not_to be(nil)
        expect(result.campaign_categories).to eq(["drip", "blast", "branding"])
        expect(result.filters.count > 0).to be_truthy
      end
    end
  end
end
