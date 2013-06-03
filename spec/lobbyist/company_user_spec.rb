require 'spec_helper'

describe Lobbyist::CompanyUser do
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      expect{Lobbyist::Company.find('invalid')}.to raise_error(Lobbyist::Error::NotFound)
    end
  end

  describe '#create' do
    after do
      Lobbyist::CompanyUser.destroy(@created.company_user_id, @created.company_id)
    end
    
    it 'should create a new company user' do
      @created = Lobbyist::CompanyUser.create('127', {
        'date_added'          => Time.now.to_s,
        'email'               => 'johndoe@gmail.com',
        'first_name'          => 'John',
        'last_name'           => 'Doe',
        'password'            => '3hg8dkfje4uf9dufs90ufskfjeil',
        'is_active'           => '1',
        'is_manager'          => '1',
        'primary_contact'     => '1',
        'accepts_terms'       => '1',
        'sugar_contact_id'    => '1234567890'
      })
      @created.should_not be_nil
      @created.should be_a(Lobbyist::CompanyUser)
      @created.first_name.should == 'John'
      @created.last_name.should == 'Doe'
      @created.is_active.should be_true
    end
  end
  
  describe '#update' do
    
    before do
      @created = Lobbyist::CompanyUser.create('127', {
        'date_added'          => Time.now.to_s,
        'email'               => 'johndoe@gmail.com',
        'first_name'          => 'John',
        'last_name'           => 'Doe',
        'password'            => '3hg8dkfje4uf9dufs90ufskfjeil',
        'is_active'           => '1',
        'is_manager'          => '1',
        'primary_contact'     => '1',
        'accepts_terms'       => '1',
        'sugar_contact_id'    => '1234567890'
      })
    end
    
    after do
      Lobbyist::CompanyUser.destroy(@created.company_user_id, @created.company_id)
    end
    
    it 'should update the company' do
      updated_user = Lobbyist::CompanyUser.update(@created.company_user_id, @created.company_id, { 'first_name' => 'New Name' })
      updated_user.should_not be_nil
      updated_user.should be_a(Lobbyist::CompanyUser)
      updated_user.first_name.should == 'New Name'
    end
  end
  
end