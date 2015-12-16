require 'spec_helper'

describe Lobbyist::V2::Base do

  describe '::find' do
    it 'should handle 400 errors' do
      VCR.use_cassette('v2/base_400_error') do
        expect{Lobbyist::V2::Company.find(127)}.to raise_error(Lobbyist::Error::BadRequest)
      end
    end

    it 'should handle 403 errors' do
      VCR.use_cassette('v2/base_403_error') do
        expect{Lobbyist::V2::Company.find(127)}.to raise_error(Lobbyist::Error::Forbidden)
      end
    end

    it 'should handle 404 errors' do
      VCR.use_cassette('v2/base_404_error') do
        expect{Lobbyist::V2::Company.find(1)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should handle 412 errors' do
      VCR.use_cassette('v2/base_412_error') do
        expect{Lobbyist::V2::Company.find(127)}.to raise_error(Lobbyist::Error::PreconditionFailed)
      end
    end

    it 'should handle 422 errors' do
      VCR.use_cassette('v2/base_422_error') do
        expect{Lobbyist::V2::Company.find(127)}.to raise_error(Lobbyist::Error::UnprocessableEntity)
      end
    end

    it 'should handle 500 series errors' do
      VCR.use_cassette('v2/base_500_error') do
        expect{Lobbyist::V2::Company.find(127)}.to raise_error(Lobbyist::Error::InternalServerError)
      end
    end
  end

end
