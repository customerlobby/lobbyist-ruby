module Lobbyist
  module V2

    class CustomerVehicle < Lobbyist::V2::Base
      attr_accessor :id, :external_id, :external_contact_id, :vin, :year, :make, :model, :created_at, :updated_at

    end

  end
end
