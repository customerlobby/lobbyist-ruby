require 'spec_helper'

describe Lobbyist::Company do
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      expect{Lobbyist::Company.find('invalid')}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found company' do
      company = Lobbyist::Company.find(127)
      company.should_not be_nil
      company.should be_a(Lobbyist::Company)
      company.categories.should_not be_nil
      company.categories.should be_a(Array)
      company.smart_invite_setting.should_not be_nil
      company.smart_invite_setting.should be_a(Lobbyist::SmartInviteSetting)
      company.reviews_count.should be_a(Lobbyist::ReviewsCount)
      # company.reviews_count.pending_reviews.should == 11
    end
  end

  describe '#create' do
    after do
      Lobbyist::Company.destroy(@created.company_id)
    end
    
    it 'should create a new review flag' do
      @created = Lobbyist::Company.create({
        'company_name'        => 'API Created',
        'company_description' => 'This company is a test created by the API.',
        'address1'            => '209 Flax Street',
        'city'                => 'Testville',
        'state'               => 'Texas',
        'zip'                 => '43987',
        'phone'               => '999-777-6666',
        'website'             => 'http://www.nowhere.com',
        'abbreviated_name'    => 'api-created',
        'creation_date'       => Time.now.to_s,
        'account_class'       => 'internal'
      })
      @created.should_not be_nil
      @created.should be_a(Lobbyist::Company)
      @created.company_name.should == 'API Created'
      @created.is_active.should be_false
    end
  end
  
  describe '#update' do
    
    before do
      @created = Lobbyist::Company.create({
        'company_name'        => 'API Created',
        'company_description' => 'This company is a test created by the API.',
        'address1'            => '209 Flax Street',
        'city'                => 'Testville',
        'state'               => 'Texas',
        'zip'                 => '43987',
        'phone'               => '999-777-6666',
        'website'             => 'http://www.nowhere.com',
        'abbreviated_name'    => 'api-created',
        'creation_date'       => Time.now.to_s,
        'account_class'       => 'internal'
      })
    end
    
    after do
      Lobbyist::Company.destroy(@created.company_id)
    end
    
    it 'should update the company' do
      updated_company = Lobbyist::Company.update(@created.company_id, { 'company_name' => 'New Name' })
      updated_company.should_not be_nil
      updated_company.should be_a(Lobbyist::Company)
      updated_company.company_name.should == 'New Name'
    end
  end
  
end