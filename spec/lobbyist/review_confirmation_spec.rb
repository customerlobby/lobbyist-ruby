require 'spec_helper'

describe Lobbyist::ReviewConfirmation do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':update' do
    
    it 'should update the review_confirmation' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'review_confirmation' => params})
      body = {id: 10, review_id: 20948, confirmation_type: 'email', confirmation_key: '123456789', status: 'confirmed'}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'review_confirmation' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_confirmation = Lobbyist::ReviewConfirmation.update(10, params)
      updated_confirmation.status.should == 'confirmed'
    end
  end
  
  describe ':find_by_confirmation_key' do
    it 'should return the found review_confirmation' do
      headers = set_headers('get', '/v1/review_confirmations/find_by_confirmation_key/123456789.json', {'nonce' => @nonce})
      body = {id: 10, review_id: 20948, confirmation_type: 'email', confirmation_key: '123456789', status: 'confirmed'}
      stub_get('/v1/review_confirmations/find_by_confirmation_key/123456789.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      confirmation = Lobbyist::ReviewConfirmation.find_by_confirmation_key('123456789')
      
      confirmation.should_not be_nil
      confirmation.should be_a(Lobbyist::ReviewConfirmation)
      confirmation.status.should == 'sent'
      confirmation.confirmation_key.should == '123456789'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/review_confirmations/#{id}.json"
    else
      "/v1/review_confirmations.json"
    end
  end
  
  def params
    {
      "id"                      => 1,
      "review_id"               => 20548,
      "confirmation_type"       => "email",
      "confirmation_key"        => "123456789",
      "status"                  => "sent",
    }
  end
  
end