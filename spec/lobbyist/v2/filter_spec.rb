require 'spec_helper'

describe Lobbyist::V2::Filter do
  describe "#list" do
    it "should return list of filters" do
      VCR.use_cassette('v2/filters_list') do
        filters = Lobbyist::V2::Filter.list(5565)

        expect(filters.elements).to_not be_blank
        expect(filters.elements.count).to eq(13)
      end
    end
  end
end
