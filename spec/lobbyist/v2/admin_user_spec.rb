require 'spec_helper'

describe Lobbyist::V2::AdminUser do
  let!(:headers) { {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token="jQuchd091cns"', 'User-Agent'=>'Faraday v0.8.7'} }
  before do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
  end

  describe "#create" do
    it "should send a correct request" do
      stub_post("/v2/admin_users.json").with(headers: headers, body: { admin_user: {} }.to_json  ).to_return(body: { admin_user: {} }.to_json, status: 200)
      Lobbyist::V2::AdminUser.create()
    end

    it "should return an instance" do
      stub_post("/v2/admin_users.json").with(headers: headers, body: { admin_user: {} }.to_json  ).to_return(body: { admin_user: {} }.to_json, status: 200)
      sut = Lobbyist::V2::AdminUser.create()
      sut.should be_a Lobbyist::V2::AdminUser
    end
  end

  describe "#update" do
    it "should send a correct request" do
      stub_put("/v2/admin_users/1.json").with(headers: headers, body: { admin_user: {} }.to_json  ).to_return(body: { admin_user: {} }.to_json, status: 200)
      Lobbyist::V2::AdminUser.update(1)
    end

    it 'should create an instance' do
      stub_put("/v2/admin_users/1.json").with(headers: headers, body: { admin_user: {} }.to_json  ).to_return(body: { admin_user: {} }.to_json, status: 200)
      sut = Lobbyist::V2::AdminUser.update(1)
      sut.should be_a Lobbyist::V2::AdminUser
    end
  end
end
