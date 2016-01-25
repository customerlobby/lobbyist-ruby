require 'spec_helper'

describe Lobbyist::V2::CategoryDefaultOfferTemplate do
  before(:all) do
    @headers = set_v2_headers
  end

  describe "#List" do
    it 'should return list of contracts' do
      VCR.use_cassette('v2/category_default_offer_template_list') do
        offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.list(12)

        expect(offer_template.class).to eq(Lobbyist::Collection)
        expect(offer_template.elements[0].campaign_type).to eq('repeat_customer')
      end
    end
  end

  describe "#find" do
    it 'should return the category default offer template' do
      VCR.use_cassette('v2/category_defualt_offer_template_find') do
        offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.find(12,13)

        expect(offer_template).to be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
        expect(offer_template.content).to eq('$25 Off Jobs Over $200')
      end
    end

    it 'should fail with status 404 given id is not valid' do
      VCR.use_cassette('v2/category_default_offer_template_find_error') do
        expect{Lobbyist::V2::CategoryDefaultOfferTemplate.find(12, 2)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end
  end

  describe "#create" do
    it 'should create and return category' do
      VCR.use_cassette('v2/category_default_offer_template_create') do
        offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.create(12, { category_default_offer_template: { content: 'sample', lower_bound: 1, upper_bound: '10', status: 'active' } })

        expect(offer_template).to be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
        expect(offer_template.content).to eq("sample")
      end
    end
  end

  describe "#update" do
    it 'should update and return category' do
      VCR.use_cassette('v2/category_default_offer_template_update') do
        offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.update(12, 96, { category_default_offer_template: { content: 'updated' } })

        expect(offer_template).to be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
        expect(offer_template.content).to eq('updated')
      end
    end
  end

  describe '#destroy' do
    it 'should delete and return category' do
      VCR.use_cassette('v2/category_default_offer_template_destroy') do
        offer_template = Lobbyist::V2::CategoryDefaultOfferTemplate.destroy(12, 96)

        expect(offer_template).to be_a(Lobbyist::V2::CategoryDefaultOfferTemplate)
        expect(offer_template.content).to eq('updated')
      end
    end
  end
end
