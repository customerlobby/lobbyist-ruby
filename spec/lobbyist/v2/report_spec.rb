require 'spec_helper'

describe Lobbyist::V2::Report do
  describe "#campaign_analysis" do
    it 'should get url for latest campaign analysis report' do
      VCR.use_cassette('v2/campaign_analysis_report') do
        result = Lobbyist::V2::Report.campaign_analysis({ company_id: 239 })
        expect(result).to be_a(Lobbyist::V2::Report)
        expect(result.url).to eq 'https://s3.amazonaws.com/customerlobby-scotty-development/239/campaign-analysis/'\
                                 'CLP_Reports_20181015124109PM.csv'
      end
    end
  end
end