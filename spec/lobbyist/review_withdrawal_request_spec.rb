require 'spec_helper'

describe Lobbyist::Review do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find review_withdrawal_request with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::ReviewWithdrawalRequest.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review_withdrawal_request' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {id: 10, review_id: 20948, status: 'requested', request_date: "#{Time.now.to_s}", note: 'Withdrawal requested.'}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      withdrawal_request = Lobbyist::ReviewWithdrawalRequest.find(10)
      
      withdrawal_request.should_not be_nil
      withdrawal_request.should be_a(Lobbyist::ReviewWithdrawalRequest)
      withdrawal_request.status.should == 'requested'
    end
  end

  describe ':create' do
    
    it 'should create a new review' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'withdrawal_request' => params})
      body = {id: 10, review_id: 20548, status: 'requested', request_date: "#{Time.now.to_s}", note: 'Withdrawal requested.'}
      stub_post(path).with(:query => {'nonce' => @nonce, 'withdrawal_request' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      withdrawal_request = Lobbyist::ReviewWithdrawalRequest.create(params)
      
      withdrawal_request.status.should == "requested"
      withdrawal_request.note.should == "Withdrawal requested."
    end
    
  end
  
  describe ':update' do
    
    it 'should update the review' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'withdrawal_request' => params})
      body = {id: 10, review_id: 20948, status: 'requested', request_date: "#{Time.now.to_s}", note: 'Withdrawal requested.'}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'withdrawal_request' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_withdrawal_request = Lobbyist::ReviewWithdrawalRequest.update(10, params)
      updated_withdrawal_request.note.should == 'Withdrawal requested.'
    end
  end
  
  describe ':find_by_email_key' do
    it 'should return the found review_withdrawal_request' do
      headers = set_headers('get', '/v1/review_withdrawal_requests/find_by_email_key/ryt867.json', {'nonce' => @nonce})
      body = {id: 10, review_id: 20948, status: 'requested', request_date: "#{Time.now.to_s}", note: 'Withdrawal requested.', email_key: 'ryt867'}
      stub_get('/v1/review_withdrawal_requests/find_by_email_key/ryt867.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      withdrawal_request = Lobbyist::ReviewWithdrawalRequest.find_by_email_key('ryt867')
      
      withdrawal_request.should_not be_nil
      withdrawal_request.should be_a(Lobbyist::ReviewWithdrawalRequest)
      withdrawal_request.status.should == 'requested'
      withdrawal_request.email_key.should == 'ryt867'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/review_withdrawal_requests/#{id}.json"
    else
      "/v1/review_withdrawal_requests.json"
    end
  end
  
  def params
    {
      "id"                      => 1,
      "review_id"               => 20548,
      "status"                  => "requested",
      "request_date"            => Time.now.to_s,
      "note"                    => "Requesting a withdrawal",
    }
  end
  
end