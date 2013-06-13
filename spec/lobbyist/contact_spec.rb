require 'spec_helper'

describe Lobbyist::Contact do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
  end
    
  context "when unsubscribing a contact" do
    
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
  
end