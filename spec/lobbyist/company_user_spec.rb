require 'spec_helper'

describe Lobbyist::CompanyUser do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of company users' do
      params = {'nonce' => @nonce}
      headers = set_headers('get', path, params)
      body = [{company_user_id: 1, email: 'johndoe@gmail.com', first_name: 'John', last_name: 'Doe', is_active: 1},{company_user_id: 1, email: 'janedoe@gmail.com', first_name: 'Jane', last_name: 'Doe', is_active: 1}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::CompanyUser.list(params)
      list.should_not be_nil
      list.should be_a(Array)
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find company user with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::CompanyUser.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end

    it 'should return the found company user' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {company_user_id: 1, email: 'johndoe@gmail.com', first_name: 'John', last_name: 'Doe', is_active: 1}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      user = Lobbyist::CompanyUser.find(10)
      
      user.should_not be_nil
      user.should be_a(Lobbyist::CompanyUser)
      user.email.should == 'johndoe@gmail.com'
    end
  end

  describe '#create' do
    
    it 'should create a new company user' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'company_id' => 12, 'company_user' => params})
      body = {company_user_id: 1, email: 'johndoe@gmail.com', first_name: 'John', last_name: 'Doe', is_active: 1}
      stub_post(path).with(:query => {'nonce' => @nonce, 'company_id' => 12, 'company_user' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      company = Lobbyist::CompanyUser.create('12', params)
      company.should_not be_nil
      company.should be_a(Lobbyist::CompanyUser)
      company.first_name.should == 'John'
      company.last_name.should == 'Doe'
      company.is_active.should be_true
    end
  end
  
  describe '#update' do
    
    it 'should update the company' do
      headers = set_headers('put', path(1), {'nonce' => @nonce, 'company_id' => 12, 'company_user' => params})
      body = {company_user_id: 1, email: 'johndoe@gmail.com', first_name: 'John', last_name: 'Doe', is_active: 1}
      stub_put(path(1)).with(:query => {'nonce' => @nonce, 'company_id' => 12, 'company_user' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      user = Lobbyist::CompanyUser.update(1, 12, params)
      user.should_not be_nil
      user.should be_a(Lobbyist::CompanyUser)
    end
  end
  
  describe '#primary' do
    it 'should return the primary company user' do
      headers = set_headers('get', '/v1/company_users/primary.json', {'nonce' => @nonce, 'company_id' => '127'})
      body = {company_user_id: 1, email: 'johndoe@gmail.com', first_name: 'John', last_name: 'Doe', is_active: 1, primary_contact: 1}
      stub_get('/v1/company_users/primary.json').with(:query => {'nonce' => @nonce, 'company_id' => '127'}, headers => headers).to_return(body: body.to_json, status: 200)
      user = Lobbyist::CompanyUser.primary(127)
      
      user.should_not be_nil
      user.should be_a(Lobbyist::CompanyUser)
      user.email.should == 'johndoe@gmail.com'
      user.primary_contact.should == 1
    end
  end
  
  def path(id = nil)
    if id
      "/v1/company_users/#{id}.json"
    else
      "/v1/company_users.json"
    end
  end
  
  def params
    {
      'email'               => 'johndoe@gmail.com',
      'first_name'          => 'John',
      'last_name'           => 'Doe',
      'password'            => '3hg8dkfje4uf9dufs90ufskfjeil',
      'is_active'           => '1',
      'is_manager'          => '1',
      'primary_contact'     => '1',
      'accepts_terms'       => '1',
      'sugar_contact_id'    => '1234567890'
    }
  end
  
end