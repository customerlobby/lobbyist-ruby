require 'spec_helper'

describe Lobbyist::Company do
  
  before do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('company_find_error') do
        expect{Lobbyist::Company.find(1)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end
    
    it 'should return the found company' do
      VCR.use_cassette('company_find') do
        company = Lobbyist::Company.find(127)

        expect(company).to_not be_nil
        expect(company).to be_a(Lobbyist::Company)
        expect(company.company_name).to eq('Customer Lobby')
      end
    end
  end

  describe ':create' do
    it 'should create a new company' do
      VCR.use_cassette('company_create') do
        company = Lobbyist::Company.create(params, user_params)

        expect(company).to_not be_nil
        expect(company).to be_a(Lobbyist::Company)
        expect(company.company_name).to eq('API Created')
        expect(company.is_active).to eq(false)
      end
    end
  end

  describe ':update' do
    it 'should update the company' do
      VCR.use_cassette('company_update') do
        company = Lobbyist::Company.update(10, {address2: 'Something new'})

        expect(company).to_not be_nil
        expect(company).to be_a(Lobbyist::Company)
        expect(company.address2).to eq('Something new')
      end
    end
  end
  
  def params
    {
      'company_name'          => 'API Created',
      'company_description'   => 'This company is a test created by the API.',
      'address1'              => '209 Flax Street',
      'city'                  => 'Testville',
      'state'                 => 'TX',
      'zip'                   => '43987',
      'phone'                 => '999-777-6666',
      'website'               => 'http://www.nowhere.com',
      'abbreviated_name'      => 'api-created',
      'freetrial_start_date'  => Time.now.to_s,
      'account_class'         => 'internal'
    }
  end
  
  def user_params
    {
      'first_name'            => 'John',
      'last_name'             => 'Hammond',
      'email'                 => 'jhammond@ingen.com',
      'password'              => '123456789',
      'password_confirmation' => '123456789'
    }
  end

end