module Lobbyist
  module V2
    class AccountManagerTodo < Lobbyist::V2::Base
      attr_accessor :todo_list

      def self.list(admin_user_id)
        response = get("/v2/account-managers/#{admin_user_id}/todos.json")
        create_from_response(response['items'])
      end
    end
  end
end