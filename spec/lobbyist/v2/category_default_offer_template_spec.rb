require 'spec_helper'

describe Lobbyist::V2::CategoryDefaultOfferTemplate do
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    @headers = set_v2_headers
  end

  describe "#List" do
    it 'should return list of contracts' do
      stub_get("/v2/categories/1/category_default_offer_templates.json").with( headers: @headers ).to_return(body: { items: [] }.to_json, status: 200)

      offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.list(1)
      offer_template.class.should eq Lobbyist::Collection
    end
  end

  describe "#find" do
    it 'should return the category default offer template' do
      offer_template = { category_default_offer_template: { id: 1, content: "sample" } }
      stub_get('/v2/categories/1/category_default_offer_templates/1.json').with( headers: @headers).to_return(body: offer_template.to_json, status: 200)
      offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.find(1,1)
      offer_template.should be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
      offer_template.content.should eq 'sample'
    end

    it 'should fail with status 404 given id is not valid' do
      body = { message: "Unable to find offer template with that id." }

      stub_get('/v2/categories/1/category_default_offer_templates/1.json').with(headers: @headers).to_return(body: body.to_json, status: 404)

      expect{Lobbyist::V2::CategoryDefaultOfferTemplate.find(1,1)}.to raise_error(Lobbyist::Error::NotFound)
    end
  end

  describe "#create" do
    it 'should create and return category' do
      params = { category_default_offer_template: { content: 'sample' } }
      stub_post('/v2/categories/1/category_default_offer_templates').with(headers: @headers, body: params).to_return(body: params.to_json, status: 200)

      offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.create(1, params)
      offer_template.should be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
      offer_template.content.should eq "sample"
    end
  end

  describe "#update" do
    it 'should update and return category' do
      params = { category_default_offer_template: { content: 'sample' } }
      stub_put('/v2/categories/1/category_default_offer_templates/1.json').with(headers: @headers, body: params).to_return(body: params.to_json, status: 200)

      offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.update(1,1,params)
      offer_template.should be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
      offer_template.content.should eq 'sample'
    end
  end

  describe '#destroy' do
    it 'should delete and return category' do
      template_params = { category_default_offer_template: { content: 'sample' } }
      stub_delete('/v2/categories/1/category_default_offer_templates/1.json').with(headers: @headers).to_return(body: template_params.to_json, status: 200)

      offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.destroy(1,1)
      offer_template.should be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
      offer_template.content.should eq 'sample'
    end
  end
end
