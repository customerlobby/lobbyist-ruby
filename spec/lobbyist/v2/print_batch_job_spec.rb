require 'spec_helper'

describe Lobbyist::V2::PrintBatchJob do

  let(:print_batch_job) { Lobbyist::V2::PrintBatchJob.new({}) }

  subject { print_batch_job }

  it { should respond_to :id }
  it { should respond_to :filename }
  it { should respond_to :status }
  it { should respond_to :sent_at }
  it { should respond_to :created_at }

  before(:all) do
    @headers = set_v2_headers
  end

  describe "#list" do
    it 'should return list of print_batch_jobs' do
      VCR.use_cassette('v2/print_batch_job_list') do
        print_batch_jobs = Lobbyist::V2::PrintBatchJob.list
        expect(print_batch_jobs.elements).to_not be_blank
        expect(print_batch_jobs.elements).to be_a(Array)
      end
    end
  end
end
