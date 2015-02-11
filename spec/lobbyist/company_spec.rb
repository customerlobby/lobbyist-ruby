require 'spec_helper'

describe Lobbyist::Company do
  
  before do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find company with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::Company.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found company' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {company_id: 2, company_name: 'Happy Time', company_description: 'All good all the time', city: 'San Francisco', state: 'CA', is_active: 1}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      company = Lobbyist::Company.find(10)
      company.should_not be_nil
      company.should be_a(Lobbyist::Company)
      company.company_name == 'Happy Time'
    end
  end

  describe ':create' do
    it 'should create a new company' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'company' => params})
      body = {company_id: 2, company_name: 'Happy Time', company_description: 'All good all the time', city: 'San Francisco', state: 'CA', is_active: 1}
      stub_post(path).with(:query => {'nonce' => @nonce, 'company' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      company = Lobbyist::Company.create(params)
      
      company.should_not be_nil
      company.should be_a(Lobbyist::Company)
      company.company_name.should == 'Happy Time'
      company.is_active.should == 1
    end
  end
  
  describe ':update' do
    it 'should update the company' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'company' => params})
      body = {company_id: 2, company_name: 'Happy Time', company_description: 'All good all the time', city: 'San Francisco', state: 'CA', is_active: 1}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'company' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      company = Lobbyist::Company.update(10, params)
      company.should_not be_nil
      company.should be_a(Lobbyist::Company)
    end
  end
  
  def path(id = nil)
    if id
      "/v1/companies/#{id}.json"
    else
      "/v1/companies.json"
    end
  end
  
  def params
    {
      'company_name'          => 'API Created',
      'company_description'   => 'This company is a test created by the API.',
      'address1'              => '209 Flax Street',
      'city'                  => 'Testville',
      'state'                 => 'Texas',
      'zip'                   => '43987',
      'phone'                 => '999-777-6666',
      'website'               => 'http://www.nowhere.com',
      'abbreviated_name'      => 'api-created',
      'free_trial_start_date' => Time.now.to_s,
      'account_class'         => 'internal'
    }
  end
  
end