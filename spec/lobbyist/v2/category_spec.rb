require 'spec_helper'

describe Lobbyist::V2::Category do
  before(:all) do
    CATEGORY_DATA = { name: "xxx", default_services: "", repeat_marketing_campaign_enabled: true, threshold: 0.682, min_days_between_mailings: 1, roi: 1, accelerator: 1, mail_delay_offset: 1, transaction_grouping_interval: 1, generate_marketing_insights: true }
  end

  describe "#list" do
    it "should return list of categories" do
      VCR.use_cassette('v2/category_list') do
        categories = Lobbyist::V2::Category.list

        expect(categories.elements).to_not be_blank
        expect(categories.elements.count).to eq(200)
      end
    end
  end

  describe "#find" do
    it "should fail with status 404 given the id is not valid" do
      VCR.use_cassette('v2/category_find_error') do
        expect{Lobbyist::V2::Category.find(999)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it "should return the category" do
      VCR.use_cassette('v2/category_find') do
        category = Lobbyist::V2::Category.find(10)

        expect(category).to be_a(Lobbyist::V2::Category)
        expect(category.name).to eq("business consulting")
      end
    end
  end

  describe "#create" do
    it "should create and return category" do
      VCR.use_cassette('v2/category_create') do
        category = Lobbyist::V2::Category.create({ category: category_data })

        expect(category).to be_a(Lobbyist::V2::Category)
        expect(category.name).to eq("xxx")
      end
    end
  end

  describe "#update" do
    it "should update and return category" do
      VCR.use_cassette('v2/category_update') do
        category = Lobbyist::V2::Category.update(284, {name: 'yyy'})

        expect(category).to be_a(Lobbyist::V2::Category)
        expect(category.name).to eq("yyy")
      end
    end
  end

  def category_data(id = nil)
    category = CATEGORY_DATA
    category[:id] = id
    category
  end
end
