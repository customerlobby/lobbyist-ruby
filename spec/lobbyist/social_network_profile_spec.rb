require 'spec_helper'

describe Lobbyist::SocialNetworkProfile do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    @nonce = Time.now.utc.to_s
  end

  describe '#find_by_type_and_page_uid' do
    
    it 'should find the social network profile' do
      path = "/v1/social_network_profiles/search.json"
      params = {'nonce' => @nonce, 'type' => 'TwitterProfile', 'page_uid' => '4wrew3erere310'}
      headers = set_headers('get', path, params)
      body = [{id: 1, page_uid: '4wrew3erere310', page_tab_company_id: 17174, type: 'TwitterProfile', category: 'profile', screen_name: 'JohnDoe', access_token: '9tu8hj3jf4k4jfrk4ghu4h4', access_secret: '4jg8jy7jk3kj4jk4k9r'},{id: 1, page_uid: '4wrew3erere310', page_tab_company_id: 33, type: 'TwitterProfile', category: 'profile', screen_name: 'JohnDoe', access_token: '9tu8hj3jf4k4jfrk4ghu4h4', access_secret: '4jg8jy7jk3kj4jk4k9r'}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      profile = Lobbyist::SocialNetworkProfile.search(params)
      profile.should be_a(Array)
      profile[0].page_tab_company_id.should == 17174
    end
  end

end