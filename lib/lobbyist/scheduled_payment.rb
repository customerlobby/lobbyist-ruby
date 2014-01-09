module Lobbyist
  class ScheduledPayment < Lobbyist::Base
    attr_accessor :id, :company_id, :subscription_id, :amount_due, :amount_paid
    attr_accessor :due_date, :paid_date, :status, :receipt_sent_at, :created_at, :updated_at
    
    def company
      @company
    end

    def company=(attributes)
      @company = Company.new(attributes)
    end

    def self.list(params = {})
      create_collection_from_response(get("/v1/scheduled_payments.json", params))
    end
  end
end