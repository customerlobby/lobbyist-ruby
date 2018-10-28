require 'spec_helper'

describe Lobbyist::V2::Reports::Company do
  describe "#campaign_analysis" do
    it 'should get url for latest campaign analysis report' do
      VCR.use_cassette('v2/reports/company/campaign_analysis_report') do
        result = Lobbyist::V2::Reports::Company.campaign_analysis(239, {})
        expect(result).to be_a(Lobbyist::V2::Reports::Company)
        expect(result.url).to eq 'https://s3.amazonaws.com/customerlobby-scotty-development/239/campaign-analysis/'\
                                 'CLP_Reports_20181015124109PM.csv'
      end
    end
  end
end