require 'spec_helper'

module Lobbyist
  describe Contact do
    
    before do
      Lobbyist.api_key = ENV['LOBBYIST_API_KEY']
      Lobbyist.api_secret = ENV['LOBBYIST_API_SECRET']
    end
    
    describe 'contact_id alias' do
      it 'should respond to contact_id or id' do
        contact = Lobbyist::Contact.new(15)
        contact.contact_id.should == 15
        contact.id.should == 15
      end
    end
    
    describe '#create' do
      
      after do
        @contact.delete
      end
      
      it 'should create a new contact' do
        params = { 'first_name' => 'John', 'last_name' => 'Doe', 'email' => 'jdoe@common.com', 'phone_daytime' => '999-123-9876', 'date_added' => "#{Time.now}" }
        @contact = Lobbyist::Contact.create(params)
        @contact.should_not be_nil
        @contact.first_name.should == 'John'
        @contact.last_name.should == 'Doe'
        @contact.email.should == 'jdoe@common.com'
        @contact.phone_daytime.should == '999-123-9876'
      end
    end
    
    describe '#update' do
      
      before do
        params = { 'first_name' => 'John', 'last_name' => 'Doe', 'email' => 'jdoe@common.com', 'phone_daytime' => '999-123-9876', 'date_added' => "#{Time.now}" }
        @contact = Lobbyist::Contact.create(params)
      end
      
      after do
        @contact.delete
      end
      
      it 'should update the contacts details' do
        params = { 'first_name' => 'Frank', 'last_name' => 'Drake'}
        @contact.update(params)
        @contact.should_not be_nil
        @contact.first_name.should == 'Frank'
        @contact.last_name.should == 'Drake'
        @contact.email.should == 'jdoe@common.com'
        @contact.phone_daytime.should == '999-123-9876'
      end
    end
    
    describe '#find' do
    
      before do
        params = { 'first_name' => 'John', 'last_name' => 'Doe', 'email' => 'jdoe@common.com', 'phone_daytime' => '999-123-9876', 'date_added' => "#{Time.now}" }
        @contact = Lobbyist::Contact.create(params)
      end
      
      after do
        @contact.delete
      end
    
      it 'should return the found contact' do
        found = Lobbyist::Contact.find(@contact.id)
        found.first_name.should == 'John'
        found.last_name.should == 'Doe'
        found.email.should == 'jdoe@common.com'
        found.phone_daytime.should == '999-123-9876'
      end
    end
    
    describe '#find_all' do
      
      before do
        params = { 'first_name' => 'John', 'last_name' => 'Doe', 'email' => 'jdoe@common.com', 'phone_daytime' => '999-123-9876', 'date_added' => "#{Time.now}" }
        @contact = Lobbyist::Contact.create(params)
      end
      
      after do
        @contact.delete
      end
      
      it 'should return all contacts for a company' do
        found = Lobbyist::Contact.find_all
        found.should_not be_nil
        found.should be_kind_of(Array)
      end
    end
    
  end
end