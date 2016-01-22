require 'spec_helper'

describe Lobbyist::V2::MemberInsightMetrics do

  let(:print_batch_job) { Lobbyist::V2::MemberInsightMetrics.new({}) }


  before(:all) do
    @headers = set_v2_headers
  end

  describe "#list" do
    it 'should return metrics for a particular company' do
      VCR.use_cassette('v2/member_insight_metrics_list') do
        metric = Lobbyist::V2::MemberInsightMetrics.list(5565)
        expect(metric.ltv).to eq("2140.88")
        expect(metric.recommended_budget).to eq(2050)
      end
    end
  end
end
