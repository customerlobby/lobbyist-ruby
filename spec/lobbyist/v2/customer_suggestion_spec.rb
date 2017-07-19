require 'spec_helper'

describe Lobbyist::V2::CustomerSuggestion do
  before(:all) do
    @headers = set_v2_headers
  end

  describe "#create" do
    it 'should create and return category' do
      company_id = 10102
      VCR.use_cassette("/v2/companies/#{company_id}/customer_suggestion_unhappy") do
        suggestion = Lobbyist::V2::CustomerSuggestion.create_unhappy_feedback(company_id, '8O4huVI19KZ_MvPOQTegMw', params())

        expect(suggestion).to be_a(Lobbyist::V2::CustomerSuggestion)
        expect(suggestion.suggestion_answer).to eq("yes")
      end
    end

    it 'should create and return category' do
      company_id = 10102
      VCR.use_cassette("/v2/companies/#{company_id}/customer_suggestion_create") do
        sugg_params = params().merge!({suggestion_topic_id: 30998})
        suggestion = Lobbyist::V2::CustomerSuggestion.create(company_id, sugg_params)

        expect(suggestion).to be_a(Lobbyist::V2::CustomerSuggestion)
        expect(suggestion.suggestion_answer).to eq("yes")
      end
    end
  end

  def params()
    {
      "contact_id"              => 58405755,
      "suggestion_answer"       => "yes",
    }
  end

end
