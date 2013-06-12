require 'spec_helper'

describe Lobbyist::Contact do
    
  context "when unsubscribing a contact" do
    it "should return the contact when it was unsubscribed" do
      x = Lobbyist::Contact.unsubscribe({"company_id" =>  127, "email" => 'msotohara@gmail.com', "reason" => 'Unsubscribe'})
      x.wants_emails.should be_false
    end
    
    it "should return an error when params are missing" do
      expect {Lobbyist::Contact.unsubscribe()}.to raise_error(Lobbyist::Error::PreconditionFailed)
    end    
  end
  
end