module Lobbyist
  class CompanySubscription < Lobbyist::Base
    def self.find_by_company(id)
      create_from_response(get("/v1/company_subscriptions/company/#{id}.json"))
    end
  end
end