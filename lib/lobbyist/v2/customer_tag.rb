module Lobbyist
  module V2

    class CustomerTag < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :filename, :status, :created_at, :updated_at

      def self.create(company_id, params = {})
        create_from_response(post("/v2/customer_tags.json", { customer_tag: params }, true))
      end
    end
  end
end
