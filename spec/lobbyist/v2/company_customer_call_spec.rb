require 'spec_helper'

describe Lobbyist::V2::CompanyCustomerCall, company_customer_call: true do
  describe "#destroy" do
    it 'should return an instance' do
      VCR.use_cassette('v2/company_customer_call_destroy') do
        customer_call = Lobbyist::V2::CompanyCustomerCall.destroy(127,2)
        expect(customer_call).to be_a(Lobbyist::V2::CompanyCustomerCall)
      end
    end
  end
end
