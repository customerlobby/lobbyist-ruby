module Lobbyist
  module V2
    class AccountManagerTodo < Lobbyist::V2::Base
      attr_accessor :todo_list

      def self.list(admin_user_id)
        response = get("/v2/account-managers/#{admin_user_id}/todos.json")
        create_from_response(response['items'])
      end

      def self.create(account_manager_id, params)
        response = post("/v2/account-managers/#{account_manager_id}/todos/create.json", {'account_manager_todo' => params})
        create_from_response(response)
      end
    end
  end
end
