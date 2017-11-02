require 'spec_helper'

describe Lobbyist::V2::GlobalCampaignSetting do
  before(:all) do
    @headers = set_v2_headers
  end

  describe "#list" do
    it 'should create and return category' do
      VCR.use_cassette("/v2/global_campaign_settings/list") do
        global_campaign = Lobbyist::V2::GlobalCampaignSetting.list().elements[0]

        expect(global_campaign).to be_a(Lobbyist::V2::GlobalCampaignSetting)
        expect(global_campaign.company_id).to eq(239)
      end
    end    
  end

  describe "#find_by_company" do
    it 'should create and return category' do
      VCR.use_cassette("/v2/global_campaign_settings/find-by-company") do
        global_campaign = Lobbyist::V2::GlobalCampaignSetting.find_by_company(239)

        expect(global_campaign).to be_a(Lobbyist::V2::GlobalCampaignSetting)
        expect(global_campaign.company_id).to eq(239)
      end
    end    
  end

  describe "#update" do
    it 'should create and return category' do
      VCR.use_cassette("/v2/global_campaign_settings/update") do
        global_campaign = Lobbyist::V2::GlobalCampaignSetting.find_by_company(239)
        global_campaign = Lobbyist::V2::GlobalCampaignSetting.update(239, params())
        expect(global_campaign).to be_a(Lobbyist::V2::GlobalCampaignSetting)
        expect(global_campaign.tag_line).to eq("tag line is now changed")
      end
    end    
  end


  def params()
    {
      "tag_line"       => "tag line is now changed",
    }
  end

end
