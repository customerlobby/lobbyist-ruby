require 'spec_helper'

describe Lobbyist::V2::Filter do
  describe '#list' do
    it 'should return list of filters' do
      VCR.use_cassette('v2/filters_list') do
        filters = Lobbyist::V2::Filter.list(company_id: 45_485)

        expect(filters).to_not be_blank
        expect(filters.items.count).to eq(10)
      end
    end
  end
end
