require 'spec_helper'

describe Lobbyist::EmailKey do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':find_by_key' do
    it 'should find the matching email key record' do
      params = {'nonce' => @nonce}
      headers = set_headers('get', '/v1/email_keys/find_by_key/f4G9u4hg7hfgkd.json', params)
      body = {id: 2, key: 'f4G9u4hg7hfgkd', action: 'info_reviewer', emailable_id: 2134, emailable_type: 'ChallengeCommunication'}
      stub_get('/v1/email_keys/find_by_key/f4G9u4hg7hfgkd.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      key = Lobbyist::EmailKey.find_by_key('f4G9u4hg7hfgkd')
      key.should be_a(Lobbyist::EmailKey)
      key.action.should == 'info_reviewer'
    end
    
  end
  
end
