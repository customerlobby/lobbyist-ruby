module Lobbyist
  module V2
    class DirectConnectImportCount < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :customers, :transactions, :vehicles, :mileages, :service_contracts
    end
  end
end