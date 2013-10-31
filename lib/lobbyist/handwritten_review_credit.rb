module Lobbyist
  class HandwrittenReviewCredit < Lobbyist::Base

    def self.summary(params = {})
      create_from_response(get("/v1/handwritten_review_credits/summary.json", params))
    end

  end
end
