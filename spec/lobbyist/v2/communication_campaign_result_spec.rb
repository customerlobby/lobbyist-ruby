require 'spec_helper'

describe Lobbyist::V2::CommunicationCampaignResult, customer_call: true do
  describe "#list" do
    it 'list all communication campaigns results' do
      VCR.use_cassette('v2/list_campaign_results') do
        result = Lobbyist::V2::CommunicationCampaignResult.list(company_id: 6090)
        expect(result).not_to be(nil)
        expect(result.data.size).to eq(1)
        expect(result.limit).to eq(20)
        expect(result.offset).to eq(0)
        expect(result.page).to eq(1)
      end
    end

    it 'find communication campaigns result by id' do
      VCR.use_cassette('v2/find_campaign_result') do
        result = Lobbyist::V2::CommunicationCampaignResult.find(3397)
        expect(result).not_to be(nil)
      end
    end

    it 'get communication campaigns result summary for a company' do
      VCR.use_cassette('v2/campaign_result_summary') do
        result = Lobbyist::V2::CommunicationCampaignResult.summary(5565)
        expect(result).not_to be(nil)
      end
    end
  end
end
