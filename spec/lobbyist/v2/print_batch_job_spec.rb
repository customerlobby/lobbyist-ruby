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
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"

    @headers = set_v2_headers
  end

  describe "#list" do
    it 'should return list of print_batch_jobs' do
      body = { count: 1, items: [{ print_batch_jobs: { filename: 'abc', status: 'abc', sent_at: Time.now } }] }
      stub_get("/v2/print-batch-jobs.json").with(:headers => @headers).to_return(body: body.to_json, status: 200)

      print_batch_jobs = Lobbyist::V2::PrintBatchJob.list
      print_batch_jobs.elements.should_not be_blank
    end
  end
end
