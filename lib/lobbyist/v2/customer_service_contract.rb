module Lobbyist
  module V2

    class CustomerServiceContract < Lobbyist::V2::Base
      attr_accessor :id, :contact_id, :external_id, :external_contact_id, :start_date, :end_date, :renew_date, :notes, :visits_per_year, :updated_at
    end

  end
end
