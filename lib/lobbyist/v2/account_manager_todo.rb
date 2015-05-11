module Lobbyist
  module V2
    class AccountManagerTodo < Lobbyist::V2::Base
      attr_accessor :calendared_at, :date, :time, :company_id, :note, :completed_at, :created_at, :updated_at

      def self.list(params = {})
        create_collection_from_response(get("/v2/account-manager-todos.json", params))
      end

      def self.show(id, params = {})
        create_from_response(get("/v2/account-manager-todos/#{id}.json", params))
      end

      def self.create(params = {})
        create_from_response(post("/v2/account-manager-todos.json", {'account_manager_todo' => params}))
      end
      
      def self.update(id, params = {})
        create_from_response(put("/v2/account-manager-todos/#{id}.json", {'account_manager_todo' => params}))
      end

      def self.destroy(id, params = {})
        create_from_response(delete("/v2/account-manager-todos/#{id}.json", params))
      end
    end
  end
end
