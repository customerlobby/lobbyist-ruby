require 'spec_helper'

describe Lobbyist::V2::Category do
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"

    CATEGORY_DATA = { name: "xxx", default_services: "", repeat_marketing_campaign_enabled: true, threshold: 1, min_days_between_mailings: 1, roi: 1, accelerator: 1, mail_delay_offset: 1, transaction_grouping_interval: 1, generate_marketing_insights: true }
  end

  describe "#list" do
    it "should return list of contracts" do
      body = { items: [{ category: category_data(1) }, { category: category_data(2) }] }
      stub_get("/v2/categories.json").with(:headers => set_v2_headers).to_return(body: body.to_json, status: 200)

      categories = Lobbyist::V2::Category.list
      categories.elements.should_not be_blank
      categories.elements.count.should eq 2
    end
  end

  describe "#find" do
    it "should fail with status 404 given the id is not valid" do
      body = {errors: ["Unable to find contact with that id."]}
      stub_get("/v2/categories/#{999}.json").with(:headers => set_v2_headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::V2::Category.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end

    it "should return the category" do
      body =  { category: category_data(10) }
      stub_get("/v2/categories/#{10}.json").with(:headers => set_v2_headers).to_return(body: body.to_json, status: 200)
      category = Lobbyist::V2::Category.find(10)
      category.should be_a(Lobbyist::V2::Category)
      category.name.should eq "xxx"
    end
  end

  describe "#create" do
    it "should create and return category" do
      params = { category: category_data }
      body = { category: category_data(1) }
      stub_post("/v2/categories").with(:headers => set_v2_headers, body: params).to_return(body: body.to_json, status: 200)
      category = Lobbyist::V2::Category.create(params)
      category.should be_a(Lobbyist::V2::Category)
      category.name.should eq "xxx"
    end
  end

  describe "#update" do
    it "should update and return category" do
      params = { category: category_data(1) }
      stub_put("/v2/categories/1.json").with(:headers => set_v2_headers, body: params).to_return(body: params.to_json, status: 200)
      category = Lobbyist::V2::Category.update(1,params)
      category.should be_a(Lobbyist::V2::Category)
      category.name.should eq "xxx"
    end
  end

  def category_data(id = nil)
    category = CATEGORY_DATA
    category[:id] = id
    category
  end
end
