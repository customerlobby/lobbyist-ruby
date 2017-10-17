require 'spec_helper'

describe Lobbyist::V2::Company, customer_call: true do
  describe "#disconnect_direct_connect" do
    it 'disconnect from the company and return the company' do
      VCR.use_cassette('v2/company_disconnect_direct_connect') do
        results = Lobbyist::V2::Company.disconnect_direct_connect(5565)
        expect(results).to be_a(Lobbyist::V2::Company)
        expect(results.workflow_system_id).to be(nil)
      end
    end
  end

  describe "#direct_connect_settings" do
    it 'direct_connect_settings for company' do
      VCR.use_cassette('v2/direct_connect_setting') do
        results = Lobbyist::V2::Company.direct_connect_setting(5565)
        expect(results).to be_a(Lobbyist::V2::DirectConnectSetting)
        expect(results.company_id).to be(5565)
      end
    end
  end
end
