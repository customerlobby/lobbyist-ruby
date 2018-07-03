# frozen_string_literal: true

module Lobbyist
  module V2
    # API wrapper for v2/zipped_image_uploads
    class ZippedImageUpload < Lobbyist::V2::Base
      attr_accessor :id, :name, :filename, :row_count, :imported_count
      attr_accessor :processed_at, :created_at, :updated_at

      def self.create(params = {})
        create_from_response(post('/v2/zipped_image_uploads.json', { 'zipped_image_upload' => params }, true))
      end
    end
  end
end
