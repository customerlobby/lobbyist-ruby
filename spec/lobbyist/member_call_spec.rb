require 'spec_helper'

describe Lobbyist::MemberCall do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get a list of completed calls' do
      params = {'nonce' => @nonce, 'admin_user_id' => 15, 'scope' => 'recently_completed'}
      headers = set_headers('get', path, params)
      body = [{id: 1, company_id: 1, admin_user_id: 15, call_number: 1, status: 'completed'},{id: 2, company_id: 1, admin_user_id: 543, call_number: 3, status: 'completed'},{id: 3, company_id: 1, admin_user_id: 35, call_number: 2, status: 'completed'}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::MemberCall.list(15, params)
      list.should be_a(Array)
      list[0].status.should == 'completed'
    end
    
    it 'should get a list of queued calls' do
      params = {'nonce' => @nonce, 'admin_user_id' => 15, 'scope' => 'current_calls'}
      headers = set_headers('get', path, params)
      body = [{id: 1, company_id: 1, admin_user_id: 15, call_number: 1, status: 'queued'},{id: 2, company_id: 1, admin_user_id: 543, call_number: 3, status: 'queued'},{id: 3, company_id: 1, admin_user_id: 35, call_number: 2, status: 'queued'}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::MemberCall.list(15, params)
      list.should be_a(Array)
      list[0].status.should == 'queued'
    end
    
    it 'should get a list of pending calls' do
      params = {'nonce' => @nonce, 'admin_user_id' => 15, 'scope' => 'pending_calls'}
      headers = set_headers('get', path, params)
      body = [{id: 1, company_id: 1, admin_user_id: 15, call_number: 1, status: 'new'},{id: 2, company_id: 1, admin_user_id: 543, call_number: 3, status: 'new'},{id: 3, company_id: 1, admin_user_id: 35, call_number: 2, status: 'new'}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::MemberCall.list(15, params)
      list.should be_a(Array)
      list[0].status.should == 'new'
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find review with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::MemberCall.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found member call' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {id: 1, company_id: 1, admin_user_id: 15, call_number: 1, status: 'queued'}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      call = Lobbyist::MemberCall.find(10)

      call.should_not be_nil
      call.should be_a(Lobbyist::MemberCall)
    end
  end
  
  describe ':update' do
    it 'should update the member call' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'member_call' => {'notes' => 'This is the new note.'}})
      body = {id: 1, company_id: 1, admin_user_id: 15, call_number: 1, status: 'new', notes: 'This is the new note.'}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'member_call' => {'notes' => 'This is the new note.'}}, headers => headers).to_return(body: body.to_json, status: 200)
      call = Lobbyist::MemberCall.update(10, {'notes' => 'This is the new note.'})
      call.should_not be_nil
      call.should be_a(Lobbyist::MemberCall)
      call.notes.should == 'This is the new note.'
    end
  end
  
  describe '#enqueue' do
    it 'should assign the admin user to the call' do
      headers = set_headers('put', '/v1/member_calls/10/enqueue.json', {'nonce' => @nonce, 'admin_user_id' => 152})
      body = {id: 1, company_id: 1, admin_user_id: 152, call_number: 1, status: 'queued'}
      stub_put('/v1/member_calls/10/enqueue.json').with(:query => {'nonce' => @nonce, 'admin_user_id' => 152}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_call = Lobbyist::MemberCall.enqueue(10, 152)
      updated_call.admin_user_id.should == 152
      updated_call.status.should == 'queued'
    end
  end

  describe '#dequeue' do
    it 'should unassign the admin user' do
      headers = set_headers('put', '/v1/member_calls/10/dequeue.json', {'nonce' => @nonce})
      body = {id: 1, company_id: 1, admin_user_id: nil, call_number: 1, status: 'new'}
      stub_put('/v1/member_calls/10/dequeue.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_call = Lobbyist::MemberCall.dequeue(10)
      updated_call.admin_user_id.should == nil
      updated_call.status.should == 'new'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/member_calls/#{id}.json"
    else
      "/v1/member_calls.json"
    end
  end
  
end