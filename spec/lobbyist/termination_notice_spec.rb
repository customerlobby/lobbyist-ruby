require 'spec_helper'

describe Lobbyist::TerminationNotice do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    @nonce = Time.now.utc.to_s
  end

  describe ':list' do
    it 'should get a list of termination notices' do
      params = {'nonce' => @nonce}
      headers = set_headers('get', '/v1/termination_notices.json', params)
      body = [{notice_id: 1, company_id: 152, notice_date: Time.now, dismissed: 0},{notice_id: 2, company_id: 153, notice_date: Time.now, dismissed: 0}]
      stub_get('/v1/termination_notices.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::TerminationNotice.list()
      list.should be_a(Array)
      list[0].dismissed.should == 0
    end
    
    it 'should get a list of dismissed notices' do
      params = {'nonce' => @nonce, 'dismissed_list' => 'true'}
      headers = set_headers('get', '/v1/termination_notices.json', params)
      body = [{notice_id: 3, company_id: 201, notice_date: Time.now, dismissed: 1},{notice_id: 4, company_id: 555, notice_date: Time.now, dismissed: 1}]
      stub_get('/v1/termination_notices.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::TerminationNotice.list({'dismissed_list' => 'true'})
      list.should be_a(Array)
      list[0].dismissed.should == 1
    end
  end
  
  describe ':dismiss' do
    
    it 'should update a termination notice' do
      headers = set_headers('put', '/v1/termination_notices/dismiss.json', {'nonce' => @nonce, 'company_id' => 17175})
      body = {notice_id: 1, company_id: 152, notice_date: Time.now, dismissed: 1}
      stub_put('/v1/termination_notices/dismiss.json').with(:query => {'nonce' => @nonce, 'company_id' => 17175}, headers => headers).to_return(body: body.to_json, status: 200)
      notice = Lobbyist::TerminationNotice.dismiss({'company_id' => '17175'})
      notice.should_not be_nil
      notice.should be_a(Lobbyist::TerminationNotice)
      notice.dismissed.should == 1
    end
  end
  
end
