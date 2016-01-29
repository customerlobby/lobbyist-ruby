module Lobbyist
  module V2

    class CustomerVehicleMileage < Lobbyist::V2::Base
      attr_accessor :id, :contact_id, :customer_transaction_id, :customer_vehicle_id, :mileage_in, :mileage_out, :created_at, :updated_at

    end

  end
end
