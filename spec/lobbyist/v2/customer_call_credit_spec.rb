require 'spec_helper'

describe Lobbyist::V2::CustomerCallCredit do
  let!(:headers) { set_v2_headers }
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
  end

  describe '#list' do
    it 'should return list of customer call credits' do
      stub_get("/v2/companies/1/customer_call_credits.json").with(headers: headers).to_return(body: { items: [] }.to_json, status: 200)

      customer_call_credits = Lobbyist::V2::CustomerCallCredit.list(1)

      expect(customer_call_credits).to be_a Lobbyist::Collection
    end
  end

  describe "#destroy" do
    it 'should return customer call credit' do
      stub_delete("/v2/companies/1/customer_call_credits/1.json").with(headers: headers).to_return(body: { customer_call_credit: { id: 1, status: 'unused', event: 'monthly' } }.to_json, status: 200)

      customer_call_credit = Lobbyist::V2::CustomerCallCredit.destroy(1,1)

      expect(customer_call_credit).to be_a Lobbyist::V2::CustomerCallCredit
    end
  end
end
