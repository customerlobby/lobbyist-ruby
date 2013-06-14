require 'spec_helper'

describe Lobbyist::ReviewFlag do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    @nonce = Time.now.utc.to_s
  end

  describe ':list' do
    it 'should get a list of review flags' do
      params = {'nonce' => @nonce}
      headers = set_headers('get', path, params)
      body = [{id: 1, review_id: 34, flagged: 1, exempted: 0, flagger_ip: '127.0.0.1', note: 'Inappropriate content', category: 'customer_created'},{id: 2, review_id: 27, flagged: 1, exempted: 0, flagger_ip: '127.0.0.1', category: 'machine_created'}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::ReviewFlag.list(params)

      list.should be_a(Array)
      list[0].flagged.should be_true
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find review_flag with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::ReviewFlag.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review flag' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {id: 1, review_id: 34, flagged: 1, exempted: 0, flagger_ip: '127.0.0.1', note: 'Inappropriate content', category: 'customer_created'}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      flag = Lobbyist::ReviewFlag.find(10)

      flag.should_not be_nil
      flag.should be_a(Lobbyist::ReviewFlag)
    end
  end
  
  describe ':create' do
    it 'should create a new review flag' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'review_flag' => params})
      body = {id: 1, review_id: 34, flagged: 1, exempted: 0, flagger_ip: '127.0.0.1', note: 'Inappropriate content', category: 'customer_created'}
      stub_post(path).with(:query => {'nonce' => @nonce, 'review_flag' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      flag = Lobbyist::ReviewFlag.create(params)
      flag.should_not be_nil
      flag.should be_a(Lobbyist::ReviewFlag)
      flag.flagged.should be_true
      flag.note.should == 'Inappropriate content'
    end
  end
  
  describe '#update' do
    it 'should update the review flag' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'review_flag' => params})
      body = {id: 1, review_id: 34, flagged: 1, exempted: 0, flagger_ip: '127.0.0.1', note: 'Inappropriate content', category: 'customer_created'}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'review_flag' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_flag = Lobbyist::ReviewFlag.update(10, params)
      updated_flag.note.should == 'Inappropriate content'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/review_flags/#{id}.json"
    else
      "/v1/review_flags.json"
    end
  end
  
  def params
    {
      'review_id'  => '205962',
      'flagged'    => '1',
      'flagger_ip' => '127.0.0.1',
      'note'       => 'This review is flagged because I say so!',
      'category'   => 'customer_created'
    }
  end
end