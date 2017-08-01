require 'spec_helper'

describe Lobbyist::V2::Company do

  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('v2/company_find_error') do
        expect{Lobbyist::V2::Company.find(1)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found company' do
      VCR.use_cassette('v2/company_find') do
        company = Lobbyist::V2::Company.find(127)

        expect(company).to_not be_nil
        expect(company).to be_a(Lobbyist::V2::Company)
        expect(company.company_name).to eq('Customer Lobby')
      end
    end
  end

end
