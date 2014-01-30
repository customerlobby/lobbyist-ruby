module Lobbyist
  class HandwrittenReviewCredit < Lobbyist::Base
    attr_accessor :id, :company_id, :event, :status, :created_at, :updated_at

    def self.summary(params = {})
      create_from_response(get("/v1/handwritten_review_credits/summary.json", params))
    end

  end
end
