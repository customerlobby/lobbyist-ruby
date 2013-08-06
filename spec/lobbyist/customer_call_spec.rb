require 'spec_helper'

describe Lobbyist::CustomerCall do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should return the found customer calls' do
      headers = set_headers('get', '/v1/customer_calls.json', {'nonce' => @nonce})
      body = [{id: 10, company_id: 14, contact_id: 7, status: 'ready', attempts: 0, notes: 'Call notes.'},{id: 11, company_id: 12, contact_id: 9, status: 'queued', attempts: 1, notes: 'Additional information required.'}]
      stub_get('/v1/customer_calls.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      calls = Lobbyist::CustomerCall.list
      calls.should_not be_nil
      calls.should be_a(Array)
      calls[0].status.should == 'ready'
      calls[0].contact_id.should == 7
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find customer_call with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::CustomerCall.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found customer_call' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {id: 10, company_id: 14, contact_id: 7, status: 'requested', attempts: 0, notes: 'Call notes.'}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      call = Lobbyist::CustomerCall.find(10)

      call.should_not be_nil
      call.should be_a(Lobbyist::CustomerCall)
      call.status.should == 'requested'
    end
  end

  # TODO: Figure out why this test isn't passing.
  # describe ':create' do
  #   
  #   it 'should create a new customer call' do
  #     headers = set_headers('post', path, {'nonce' => @nonce, 'customer_call' => params})
  #     body = {id: 1, company_id: 12, contact_id: 17, status: 'requested', attempts: 0, notes: 'Call notes.'}
  #     stub_post(path).with(:query => {'nonce' => @nonce, 'customer_call' => params}, headers => headers).to_return(body: body.to_json, status: 200)
  #     call = Lobbyist::CustomerCall.create(params)
  # 
  #     call.status.should == "requested"
  #     call.reason.should == "not_a_customer"
  #   end
  #   
  # end
  
  describe ':update' do
    
    it 'should update the customer call' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'customer_call' => params})
      body = {id: 10, company_id: 14, contact_id: 7, status: 'requested', attempts: 0, notes: 'Call notes.'}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'customer_call' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_call = Lobbyist::CustomerCall.update(10, params)
      updated_call.status.should == 'requested'
    end
  end
  
  describe ':enqueue' do
    
    it 'should update the customer call record with the admin_user_id' do
      headers = set_headers('put', '/v1/customer_calls/10/enqueue.json', {'nonce' => @nonce, 'admin_user_id' => 152})
      body = {id: 10, company_id: 14, contact_id: 7, admin_user_id: 152, status: 'requested', attempts: 0, notes: 'Call notes.'}
      stub_put('/v1/customer_calls/10/enqueue.json').with(:query => {'nonce' => @nonce, 'admin_user_id' => 152}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_call = Lobbyist::CustomerCall.enqueue(10, 152)
      updated_call.status.should == 'requested'
      updated_call.admin_user_id.should == 152
    end
  end
  
  describe ':dequeue' do
    
    it 'should update the customer call record and remove the admin_user_id' do
      headers = set_headers('put', '/v1/customer_calls/10/dequeue.json', {'nonce' => @nonce})
      body = {id: 10, company_id: 14, contact_id: 7, admin_user_id: nil, status: 'requested', attempts: 0, notes: 'Call notes.'}
      stub_put('/v1/customer_calls/10/dequeue.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_call = Lobbyist::CustomerCall.dequeue(10)
      updated_call.status.should == 'requested'
      updated_call.admin_user_id.should be_nil
    end
  end

  def path(id = nil)
    if id
      "/v1/customer_calls/#{id}.json"
    else
      "/v1/customer_calls.json"
    end
  end
  
  def params
    {
      "id"                      => 1,
      "company_id"              => 12,
      "contact_id"              => 17,
      "admin_user_id"           => 152,
      "status"                  => "requested",
      "attempts"                => 0,
      "notes"                   => 'Here there be notes.',
      "created_at"              => Time.now.to_s,
      "updated_at"              => Time.now.to_s
    }
  end
  
end