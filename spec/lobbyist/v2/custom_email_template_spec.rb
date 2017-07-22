require 'spec_helper'

describe Lobbyist::V2::CustomEmailTemplate do
  before(:all) do
    @headers = set_v2_headers
  end

  describe "#list" do

    it 'should get CustomEmailTemplates for a given company' do
      company_id = 10102
      VCR.use_cassette("/v2/companies/#{company_id}/custom_email_templates_list") do
        custom_template = Lobbyist::V2::CustomEmailTemplate.list(company_id)

        expect(custom_template.elements[0]).to be_a(Lobbyist::V2::CustomEmailTemplate)
      end
    end
  end

  

end
