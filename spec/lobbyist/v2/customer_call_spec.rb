require 'spec_helper'

describe Lobbyist::V2::CustomerCall do
  let!(:headers) { {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token="jQuchd091cns"', 'User-Agent'=>'Faraday v0.8.7'} }
  before do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
  end

  describe "#destroy" do
    it "should send a correct request" do
      stub_delete("/v2/companies/1/customer_calls/1.json").with(headers: headers).to_return(body: { customer_call: {} }.to_json, status: 200)
      Lobbyist::V2::CustomerCall.destroy(1,1)
    end

    it 'should return an instance' do
      stub_delete("/v2/companies/1/customer_calls/1.json").with(headers: headers).to_return(body: { customer_call: {} }.to_json, status: 200)
      sut = Lobbyist::V2::CustomerCall.destroy(1,1)
      sut.should be_a Lobbyist::V2::CustomerCall
    end
  end
end
