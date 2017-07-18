require 'spec_helper'

describe Lobbyist::V2::CustomerSuggestion do
  before(:all) do
    @headers = set_v2_headers
  end

  describe "#create" do
    it 'should create and return category' do
      company_id = 10102
      VCR.use_cassette("/v2/companies/#{company_id}/customer_suggestion_create") do
        suggestion = Lobbyist::V2::CustomerSuggestion.create(company_id, 'zkzN-zhy1C7e8CzQoAhY7Q', params())

        expect(suggestion).to be_a(Lobbyist::V2::CustomerSuggestion)
        expect(suggestion.suggestion_answer).to eq("Not Happy")
      end
    end
  end

  def params()
    {
      "contact_id"              => 58410735,
      "suggestion_answer"       => "Not Happy",
    }
  end

end
