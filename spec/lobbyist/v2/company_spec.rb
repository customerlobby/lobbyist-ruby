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

  describe "#direct_connect_import_counts" do
    it 'get direct connect import counts for a company' do
      VCR.use_cassette('v2/direct_connect_import_counts') do
        results = Lobbyist::V2::Company.direct_connect_import_counts(5565)
        expect(results).to be_a(Lobbyist::V2::DirectConnectImportCount)
        expect(results.company_id).to be(5565)
      end
    end

    it 'get direct connect import counts as 0 for a company' do
      VCR.use_cassette('v2/direct_connect_import_counts_0') do
        results = Lobbyist::V2::Company.direct_connect_import_counts(40497)
        expect(results).to be_a(Lobbyist::V2::DirectConnectImportCount)
        expect(results.company_id).to be(40497)
        expect(results.customers).to be(0)
        expect(results.transactions).to be(0)
        expect(results.vehicles).to be(0)
        expect(results.mileages).to be(0)
        expect(results.service_contracts).to be(0)
      end
    end

    it 'get direct connect import counts for a company and validate all counts' do
      VCR.use_cassette('v2/direct_connect_import_counts_validate') do
        results = Lobbyist::V2::Company.direct_connect_import_counts(40365)
        expect(results).to be_a(Lobbyist::V2::DirectConnectImportCount)
        expect(results.company_id).to be(40365)
        expect(results.customers).to be(111)
        expect(results.transactions).to be(222)
        expect(results.vehicles).to be(333)
        expect(results.mileages).to be(444)
        expect(results.service_contracts).to be(555)
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
