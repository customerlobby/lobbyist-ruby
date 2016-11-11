module Lobbyist
  module V2
    class AmAssignableCompany < Lobbyist::V2::Base
      attr_accessor :company_id, :company_name, :account_class, :status, :date_live
      attr_accessor :enterprise, :classification, :reviews_count, :close_date, :admin_notes

      def self.list(params = {})
        create_collection_from_response(get("/v2/am-assignable-companies.json", params))
      end
    end
  end
end
