require 'spec_helper'

describe Lobbyist::CompanyUser do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of company users' do
      VCR.use_cassette('company_user_list') do
        list = Lobbyist::CompanyUser.list(company_id: 127)

        expect(list).to_not be_nil
        expect(list).to be_a(Array)
      end
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('company_user_find_error') do
        expect{Lobbyist::CompanyUser.find(1)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found company user' do
      VCR.use_cassette('company_user_find') do
        user = Lobbyist::CompanyUser.find(15)
      
        expect(user).to_not be_nil
        expect(user).to be_a(Lobbyist::CompanyUser)
        expect(user.email).to eq('jeff@customerlobby.com')
      end
    end
  end

  describe '#create' do
    it 'should create a new company user' do
      VCR.use_cassette('company_user_create') do
        company = Lobbyist::CompanyUser.create(127, params)

        expect(company).to_not be_nil
        expect(company).to be_a(Lobbyist::CompanyUser)
        expect(company.first_name).to eq('John')
        expect(company.last_name).to eq('Doe')
        expect(company.is_active).to eq(true)
      end
    end
  end

  describe '#update' do
    it 'should update the company' do
      VCR.use_cassette('company_user_update') do
        user = Lobbyist::CompanyUser.update(15, 10, {is_active: false})

        expect(user).to_not be_nil
        expect(user).to be_a(Lobbyist::CompanyUser)
        expect(user.is_active).to eq(false)
      end
    end
  end

  describe '#primary' do
    it 'should return the primary company user' do
      VCR.use_cassette('company_user_primary') do
        user = Lobbyist::CompanyUser.primary(127)

        expect(user).to_not be_nil
        expect(user).to be_a(Lobbyist::CompanyUser)
        expect(user.email).to eq('ted@customerlobby.com')
        expect(user.primary_contact).to eq(true)
      end
    end
  end
  
  def params
    {
      'email'                 => 'johndoe@gmail.com',
      'first_name'            => 'John',
      'last_name'             => 'Doe',
      'password'              => '3hg8dkfje4uf9dufs90ufskfjeil',
      'password_confirmation' => '3hg8dkfje4uf9dufs90ufskfjeil',
      'is_active'             => '1',
      'is_manager'            => '1',
      'primary_contact'       => '1',
      'accepts_terms'         => '1'
    }
  end
  
end