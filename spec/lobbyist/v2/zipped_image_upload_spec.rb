# frozen_string_literal: true

require 'spec_helper'

describe Lobbyist::V2::ZippedImageUpload do
  describe '#find' do
    it 'should fail with status 404 given the id is not valid' do
      VCR.use_cassette('v2/zipped_image_upload_find_error') do
        expect { Lobbyist::V2::ZippedImageUpload.find(999) }.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the zipped_image_upload' do
      VCR.use_cassette('v2/zipped_image_upload_find') do
        zipped_upload = Lobbyist::V2::ZippedImageUpload.find(24)

        expect(zipped_upload).to be_a(Lobbyist::V2::ZippedImageUpload)
        expect(zipped_upload.row_count).to eq(2)
      end
    end
  end

  describe '#create' do
    it 'should create and return zipped_image_upload' do
      VCR.use_cassette('v2/zipped_image_upload_create') do
        params = {
          'zip_file' => Faraday::UploadIO.new(File.join(RSPEC_ROOT, 'files', 'CL_Image_Uploads_20180629_01.zip'), 'application/zip')
        }
        zipped_upload = Lobbyist::V2::ZippedImageUpload.create(params)
        expect(zipped_upload).to be_a(Lobbyist::V2::ZippedImageUpload)
      end
    end
  end

  describe '#update' do
    it 'should update and return zipped_image_upload' do
      VCR.use_cassette('v2/zipped_image_upload_update') do
        zipped_upload = Lobbyist::V2::ZippedImageUpload.update(24, imported_count: 1)

        expect(zipped_upload).to be_a(Lobbyist::V2::ZippedImageUpload)
        expect(zipped_upload.imported_count).to eq(1)
      end
    end
  end
end
