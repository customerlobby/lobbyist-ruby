module Lobbyist
  module V2
    class AccountManagerTodo < Lobbyist::V2::Base
      attr_accessor :date, :time, :company_id, :note, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/account-manager-todos.json", params))
      end

      def self.create(account_manager_id, params = {})
        create_from_response(post("/v2/account-manager-todos.json", {'account_manager_todo' => params}))
      end
    end
  end
end
