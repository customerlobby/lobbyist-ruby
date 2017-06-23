require 'spec_helper'

describe Lobbyist::V2::DataUpload, customer_call: true do
  describe "#create" do
    it 'should return an instance' do
      VCR.use_cassette('v2/data_upload_create') do
        params = {
            "company_id"=>"47103",
            "filename"=>"CLP_47103_20170519005025AM.zip",
            "status"=>"uploaded_to_s3",
            "data_collection_successful"=>"false",
            "workflow_system_used"=>"169",
            "mapper_used"=>"ServiceTitanMapper",
            "data_file"=> Faraday::UploadIO.new(File.join(RSPEC_ROOT,'files','CLP_47103_20170519005025AM.zip'),'application/zip')
        }
        data_upload = Lobbyist::V2::DataUpload.create(params)
        expect(data_upload).to be_a(Lobbyist::V2::DataUpload)
      end
    end
  end
end
