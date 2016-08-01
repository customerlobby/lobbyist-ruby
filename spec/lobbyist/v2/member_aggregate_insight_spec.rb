require 'spec_helper'

describe Lobbyist::V2::MemberAggregateInsight do

  let(:member_insight){Lobbyist::V2::MemberAggregateInsight.new({})}

  before(:all) do
    @headers = set_v2_headers
  end

  describe 'update' do
    it 'should update the member aggregate insight' do
      company_id = 5565
      VCR.use_cassette("/v2/companies/#{company_id}/member-aggregate-insight.json") do
        insight = Lobbyist::V2::MemberAggregateInsight.update(company_id, {credit_calculation_status: 'completed_2015-11-04'})
        expect(insight.credit_calculation_status).to eq('completed_2015-11-04')
      end
    end
  end
end
