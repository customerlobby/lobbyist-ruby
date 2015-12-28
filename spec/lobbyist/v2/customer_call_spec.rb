require 'spec_helper'

describe Lobbyist::V2::CustomerCall do
  describe "#destroy" do
    it 'should return an instance' do
      VCR.use_cassette('v2/customer_call_destroy') do
        customer_call = Lobbyist::V2::CustomerCall.destroy(127,2)
        expect(customer_call).to be_a(Lobbyist::V2::CustomerCall)
      end
    end
  end
end
