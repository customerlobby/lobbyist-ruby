require 'spec_helper'

describe Lobbyist::V2::Admin::CampaignIteration do
  before(:all) do
    @headers = set_v2_headers
  end

  describe "#list" do
    it 'should return list of contracts' do
      VCR.use_cassette('v2/admin/campaign_iteration_list') do
        offer_template = Lobbyist::V2::Admin::CampaignIteration.list

        expect(offer_template.class).to eq Lobbyist::Collection
      end
    end
  end
end
