# frozen_string_literal: true

require 'spec_helper'

describe Lobbyist::V2::Zipcode do
  describe '#list' do
    it 'should return the zipped_image_upload' do
      VCR.use_cassette('v2/zipcode_list') do
        data = Lobbyist::V2::Zipcode.list(company_id: 239)

        expect(data).to be_a(Hash)
        expect(data.total_count).to eq(912)
        expect(data.zipcodes).to be_a(Array)
      end
    end
  end
end
