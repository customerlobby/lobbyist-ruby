require 'spec_helper'

describe Lobbyist::V2::DataWarehouseJob do

  # Test Case for Lobbist:V2::DataWarehouseJob Update.
  it 'should update the DataWarehouseJob' do
    VCR.use_cassette('v2/data_warehouse_job_update') do
      dw_job = Lobbyist::V2::DataWarehouseJob.update(1, {status: "algorithm_completed", result_filename: 'CL-Test'})
      expect(dw_job).to be_a(Lobbyist::V2::DataWarehouseJob)
      expect(dw_job.status).to eq('algorithm_completed')
    end
  end

  # Test Case for Lobbist:V2::DataWarehouseJob Update should raise error if id not present.
  it 'should get the error if job is not present' do
    VCR.use_cassette('v2/data_warehouse_job_update_error') do
      expect{ Lobbyist::V2::DataWarehouseJob.update(11234, {status: "algorithm_completed",
                                                            result_filename: 'CL-Test'}) }.to raise_error
    end
  end
end
