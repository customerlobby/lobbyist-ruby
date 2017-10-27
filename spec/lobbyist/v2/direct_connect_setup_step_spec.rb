require 'spec_helper'

describe Lobbyist::V2::DirectConnectSetupStep, customer_call: true do
  describe '#update_dc_setup_step' do
    it 'update direct connect setup step' do
      VCR.use_cassette('v2/dc_setup_step_update') do
        results = Lobbyist::V2::DirectConnectSetupStep.update(1, {status: 'success', recorded_date: Time.now.utc.to_s})
        expect(results).to be_a(Lobbyist::V2::DirectConnectSetupStep)
      end
    end
  end

  describe '#list_all_dc_setup_steps_for_all_companies' do
    it 'list all direct connect setup steps for all companies' do
      VCR.use_cassette('v2/dc_setup_steps_companies') do
        results = Lobbyist::V2::DirectConnectSetupStep.list({'company_id' => 5565})
        expect(results).to be_a(Array)
        expect(results.size).to eq(5)
      end
    end
  end

  describe '#get_dc_setup_steps_for_company' do
    it 'list all direct connect steps for a company' do
      VCR.use_cassette('v2/dc_setup_steps_company') do
        results = Lobbyist::V2::DirectConnectSetupStep.find(1)
        expect(results).to be_a(Lobbyist::V2::DirectConnectSetupStep)
      end
    end
  end
end