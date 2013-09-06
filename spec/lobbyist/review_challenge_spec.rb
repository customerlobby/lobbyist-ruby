require 'spec_helper'

describe Lobbyist::ReviewChallenge do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should return the found review_challenge' do
      headers = set_headers('get', '/v1/review_challenges.json', {'nonce' => @nonce})
      body = {count: 2, elements: [{id: 1, review_id: 20948, reason: 'not_a_customer', status: 'requested', read: 0, created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"},{id: 2, review_id: 20949, reason: 'not_a_customer', status: 'requested', read: 0, created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}]}
      stub_get('/v1/review_challenges.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      challenge = Lobbyist::ReviewChallenge.list

      challenge.should_not be_nil
      challenge.should be_a(Lobbyist::Collection)
      challenge.count.should == 2
      challenge.elements[0].status.should == 'requested'
      challenge.elements[0].review_id.should == 20948
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find review_challenge with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::ReviewChallenge.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review_challenge' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {id: 10, review_id: 20948, reason: 'not_a_customer', status: 'requested', read: 0, created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      challenge = Lobbyist::ReviewChallenge.find(10)

      challenge.should_not be_nil
      challenge.should be_a(Lobbyist::ReviewChallenge)
      challenge.status.should == 'requested'
    end
  end

  describe ':create' do
    
    it 'should create a new review challenge' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'review_challenge' => params})
      body = {id: 10, review_id: 20948, reason: 'not_a_customer', status: 'requested', read: 0, created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}
      stub_post(path).with(:query => {'nonce' => @nonce, 'review_challenge' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      challenge = Lobbyist::ReviewChallenge.create(params)

      challenge.status.should == "requested"
      challenge.reason.should == "not_a_customer"
    end
    
  end
  
  describe ':update' do
    
    it 'should update the review challenge' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'review_challenge' => params})
      body = {id: 10, review_id: 20948, reason: 'not_a_customer', status: 'requested', read: 0, created_at: "#{Time.now.to_s}", updated_at: "#{Time.now.to_s}"}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'review_challenge' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_challenge = Lobbyist::ReviewChallenge.update(10, params)
      updated_challenge.status.should == 'requested'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/review_challenges/#{id}.json"
    else
      "/v1/review_challenges.json"
    end
  end
  
  def params
    {
      "id"                      => 1,
      "review_id"               => 20548,
      "reason"                  => 'not_a_customer',
      "status"                  => "requested",
      "read"                    => 0,
      "created_at"              => Time.now.to_s,
      "updated_at"              => Time.now.to_s
    }
  end
  
end