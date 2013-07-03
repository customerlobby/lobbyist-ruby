require 'spec_helper'

describe Lobbyist::TerminationNotice do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get a list of termination notices' do
      params = {'nonce' => @nonce}
      headers = set_headers('get', '/v1/termination_notices.json', params)
      body = [{id: 1, company_id: 152, created_at: Time.now, updated_at: Time.now, dismissed: 0},{id: 2, company_id: 153, created_at: Time.now, updated_at: Time.now, dismissed: 0}]
      stub_get('/v1/termination_notices.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::TerminationNotice.list()
      list.should be_a(Array)
      list[0].dismissed.should == 0
    end
    
    it 'should get a list of dismissed notices' do
      params = {'nonce' => @nonce, 'dismissed_list' => 'true'}
      headers = set_headers('get', '/v1/termination_notices.json', params)
      body = [{id: 3, company_id: 201, created_at: Time.now, updated_at: Time.now, dismissed: 1},{id: 4, company_id: 555, created_at: Time.now, updated_at: Time.now, dismissed: 1}]
      stub_get('/v1/termination_notices.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::TerminationNotice.list({'dismissed_list' => 'true'})
      list.should be_a(Array)
      list[0].dismissed.should == 1
    end
  end
  
  describe ':dismiss' do
    
    it 'should update a termination notice' do
      headers = set_headers('put', '/v1/termination_notices/12/dismiss.json', {'nonce' => @nonce})
      body = {id: 12, company_id: 152, created_at: Time.now, updated_at: Time.now, dismissed: 1}
      stub_put('/v1/termination_notices/12/dismiss.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      notice = Lobbyist::TerminationNotice.dismiss(12)
      notice.should_not be_nil
      notice.should be_a(Lobbyist::TerminationNotice)
      notice.dismissed.should == 1
    end
  end
  
end
