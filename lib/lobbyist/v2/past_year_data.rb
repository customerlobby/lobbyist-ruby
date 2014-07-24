module Lobbyist
  module V2

    class PastYearData < Lobbyist::V2::Base

      attr_accessor :added_customer_count, :new_customer_count, :repeat_customer_count 
      attr_accessor :revenue_from_new_customers, :revenue_from_repeat_customers

    end

  end
end