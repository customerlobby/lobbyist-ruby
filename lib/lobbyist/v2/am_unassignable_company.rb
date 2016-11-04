module Lobbyist
  module V2
    class AmUnassignableCompany < Lobbyist::V2::Base
      attr_accessor :company_id, :company_name, :ae, :account_class, :status, :date_live
      attr_accessor :enterprise, :reviews_count, :close_date, :admin_notes

      def self.list(params = {})
        create_collection_from_response(get("/v2/am-unassignable-companies.json", params))
      end
    end
  end
end
