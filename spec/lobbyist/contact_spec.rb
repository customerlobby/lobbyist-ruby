require 'spec_helper'

describe Lobbyist::Contact do
  
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
      body = {errors: ["Unable to find contact with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::Contact.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found contact' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {contact_id: 10, company_id: 12, first_name: 'John', last_name: 'Doe', email: 'jdoe@gmail.com', wants_emails: '1'}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      contact = Lobbyist::Contact.find(10)
      contact.should_not be_nil
      contact.should be_a(Lobbyist::Contact)
      contact.first_name == 'John'
    end
  end

  describe ':create' do
    it 'should create a new contact' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'contact' => params})
      body = {contact_id: 10, company_id: 12, first_name: 'John', last_name: 'Doe', email: 'jdoe@gmail.com', wants_emails: '1'}
      stub_post(path).with(:query => {'nonce' => @nonce, 'contact' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      contact = Lobbyist::Contact.create(params)
      contact.should_not be_nil
      contact.should be_a(Lobbyist::Contact)
      contact.first_name.should == 'John'
      contact.wants_emails.should == '1'
    end
  end
  
  describe ':update' do
    it 'should update the contact' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'contact' => params})
      body = {contact_id: 10, company_id: 12, first_name: 'John', last_name: 'Doe', email: 'jdoe@gmail.com', wants_emails: '1'}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'contact' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      contact = Lobbyist::Contact.update(10, params)
      contact.should_not be_nil
      contact.should be_a(Lobbyist::Contact)
    end
  end

  describe ':search' do
    it 'should get a list of contacts' do
      params = {'nonce' => @nonce}
      headers = set_headers('get', '/v1/contacts/search.json', params)
      body = [{contact_id: 10, company_id: 12, first_name: 'John', last_name: 'Doe', email: 'jdoe@gmail.com', wants_emails: '1'},{contact_id: 11, company_id: 12, first_name: 'Jane', last_name: 'Doe', email: 'janedoe@gmail.com', wants_emails: '0'}]
      stub_get('/v1/contacts/search.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::Contact.search(params)

      list.should be_a(Array)
      list[0].wants_emails.should == '1'
    end
  end
  
  describe 'PUT unsubscribe' do
    it "should return the contact when it was unsubscribed" do
      path = '/v1/contacts/unsubscribe.json';params = {"email" => 'jon.doe@gmail.com', "reason" => 'I dont like your service', "company_id" => 1} 
      Lobbyist::Base.add_nonce(params)
      headers = set_headers("put",path,params)
      body = {contact_id: 1, email: 'jon.doe@gmail.com', wants_emails: false}
      stub_put(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)            
      contact = Lobbyist::Contact.unsubscribe(params)
      contact.wants_emails.should be_false
    end
    
    it "should return an error when params are missing" do
      path = '/v1/contacts/unsubscribe.json';params = {} 
      Lobbyist::Base.add_nonce(params)
      headers = set_headers("put",path,params)
      body = { errors: ["Required Parameters: reason, email are missing."] }
      stub_put(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 412)      
      expect {Lobbyist::Contact.unsubscribe()}.to raise_error(Lobbyist::Error::PreconditionFailed)
    end    
  end
  
  def path(id = nil)
    if id
      "/v1/contacts/#{id}.json"
    else
      "/v1/contacts.json"
    end
  end

  def params
    {
      'company_id'          => '12',
      'first_name'          => 'John',
      'last_name'           => 'Doe',
      'email'               => 'jdoe@gmail.com',
      'wants_emails'        => '1',
    }
  end

end