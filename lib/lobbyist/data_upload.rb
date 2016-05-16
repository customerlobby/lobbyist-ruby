module Lobbyist
  class DataUpload < Lobbyist::Base

    attr_accessor :id, :company_id, :filename, :status, :retry_count, :error_message, :data_collection_successful,
    :created_at, :updated_at, :uploaded_date, :customers_count, :transactions_count        


    def self.list(params = {})
      create_collection_from_response(get('/v1/data_uploads.json', params))
    end
  end
end
