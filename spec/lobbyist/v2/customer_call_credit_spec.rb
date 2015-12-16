require 'spec_helper'

describe Lobbyist::V2::CustomerCallCredit do
  before(:all) do
    @headers = set_v2_headers
  end

  describe '#list' do
    it 'should return list of customer call credits' do
      VCR.use_cassette('v2/customer_call_credit_list') do
        customer_call_credits = Lobbyist::V2::CustomerCallCredit.list(10)

        expect(customer_call_credits).to be_a Lobbyist::Collection
      end
    end
  end

  describe "#destroy" do
    it 'should return customer call credit' do
      VCR.use_cassette('v2/customer_call_credit_destroy') do
        customer_call_credit = Lobbyist::V2::CustomerCallCredit.destroy(10,1)

        expect(customer_call_credit).to be_a Lobbyist::V2::CustomerCallCredit
      end
    end
  end
end
