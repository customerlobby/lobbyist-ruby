require 'spec_helper'

describe Lobbyist::ChallengeCommunication do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should return the list of challenge_communications' do
      headers = set_headers('get', '/v1/challenge_communications.json', {'nonce' => @nonce})
      body = [{id: 1, review_challenge_id: 20948, contact_id: 1234, communication_body: 'This is the communication body', email_key: 'ghty4j5u', created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"},{id: 2, review_challenge_id: 20948, contact_id: 1234, communication_body: 'This is the communication body', email_key: 'de90erfjiff88', created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}]
      stub_get('/v1/challenge_communications.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      challenge = Lobbyist::ChallengeCommunication.list

      challenge.should_not be_nil
      challenge.should be_a(Array)
      challenge[0].review_challenge_id.should == 20948
      challenge[0].contact_id.should == 1234
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find challenge_communication with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::ChallengeCommunication.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review_withdrawal_request' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {id: 1, review_challenge_id: 20948, contact_id: 1234, communication_body: 'This is the communication body', email_key: 'ghty4j5u', created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      communication = Lobbyist::ChallengeCommunication.find(10)

      communication.should_not be_nil
      communication.should be_a(Lobbyist::ChallengeCommunication)
      communication.communication_body.should == 'This is the communication body'
    end
  end

  describe ':create' do
    
    it 'should create a new challenge_communication' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'challenge_communication' => params})
      body = {id: 1, review_challenge_id: 20948, contact_id: 1234, communication_body: 'This is the communication body', email_key: 'ghty4j5u', created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}
      stub_post(path).with(:query => {'nonce' => @nonce, 'challenge_communication' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      communication = Lobbyist::ChallengeCommunication.create(params)
      communication.contact_id.should == 1234
    end
    
  end
  
  describe ':find_by_email_key' do
    it 'should return the found challenge_communication' do
      headers = set_headers('get', '/v1/challenge_communications/find_by_email_key/ryt867.json', {'nonce' => @nonce})
      body = {id: 1, review_challenge_id: 20948, contact_id: 1234, communication_body: 'This is the communication body', email_key: 'ryt867', created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}
      stub_get('/v1/challenge_communications/find_by_email_key/ryt867.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      communication = Lobbyist::ChallengeCommunication.find_by_email_key('ryt867')

      communication.should_not be_nil
      communication.should be_a(Lobbyist::ChallengeCommunication)
      communication.email_key.should == 'ryt867'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/challenge_communications/#{id}.json"
    else
      "/v1/challenge_communications.json"
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