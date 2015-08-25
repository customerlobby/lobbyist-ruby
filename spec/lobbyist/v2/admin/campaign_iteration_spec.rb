require 'spec_helper'

describe Lobbyist::V2::Admin::CampaignIteration do
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    @headers = {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token="jQuchd091cns"', 'User-Agent'=>'Faraday v0.8.7'}
  end

  describe "#list" do
    it 'should return list of contracts' do
      stub_get('/v2/admin/campaign-iterations.json').with( header: @headers ).to_return(body: { items: [] }.to_json, status: 200)

      offer_template = Lobbyist::V2::Admin::CampaignIteration.list
      offer_template.class.should eq Lobbyist::Collection
    end
  end
end
