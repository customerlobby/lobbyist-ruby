module Lobbyist
  class EnterpriseSetting < Lobbyist::Base
    attr_accessor :id, :enterprise_id, :location_license_fee, :location_activation_fee
    attr_accessor :location_termination_fee, :creation_fee, :reactivation_fee, :termination_fee
    attr_accessor :mist_fee, :billing_email, :wants_member_calls, :created_at, :updated_at
  end
end
