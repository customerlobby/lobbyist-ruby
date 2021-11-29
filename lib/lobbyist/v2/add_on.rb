module Lobbyist
  module V2

    class AddOn < Lobbyist::V2::Base
      attr_accessor :id, :parentable_id, :parentable_type, :name, :short_name, :cost, :amount,
                    :status, :rollable, :start_date, :expiration_date
      
    end

  end
end