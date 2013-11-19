require 'spec_helper'

describe Lobbyist::Review do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of reviews' do
      params = {'nonce' => @nonce, 'company_id' => '20154', 'status' => 'publish'}
      headers = set_headers('get', path, params)
      body = { count: 2, elements: [{review_id: 1, review_summary: 'Review Summary', review_body: 'Review Body', review_status: 'publish'},{review_id: 2, review_summary: 'Review Summary 1', review_body: 'Review Body 1', review_status: 'publish'}]}
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      reviews = Lobbyist::Review.list(params)

      reviews.should_not be_nil
      reviews.should be_a(Lobbyist::Collection)
      reviews.count.should == 2
      reviews.elements[0].review_body.should == 'Review Body'
      reviews.elements[1].review_body.should == 'Review Body 1'
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find review with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::Review.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review' do
      headers = set_headers('get', path(10), {'nonce' => @nonce})
      body = {review_id: 10, review_summary: 'Review Summary', review_body: 'Review Body', review_status: 'publish'}
      stub_get(path(10)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      review = Lobbyist::Review.find(10)
      
      review.should_not be_nil
      review.should be_a(Lobbyist::Review)
      review.review_body.should == 'Review Body'
    end
  end

  describe ':create' do
    
    it 'should create a new review' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'review' => params})
      body = {review_id: 100, review_summary: 'New Review Summary', review_body: 'This is the body.', review_status: 'publish', total_score: 1.0, source: 'web', reviewer_location_state: 'CA', reviewer_location_city: 'Yuba'}
      stub_post(path).with(:query => {'nonce' => @nonce, 'review' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      review = Lobbyist::Review.create(params)
      
      review.review_summary.should == "New Review Summary"
      review.review_body.should == "This is the body."
    end
    
  end
  
  describe ':update' do
    
    it 'should update the review' do
      headers = set_headers('put', path(10), {'nonce' => @nonce, 'review' => params})
      body = {review_id: 100, review_summary: 'New Review Summary', review_body: 'This is the body.', review_status: 'publish', total_score: 1.0, source: 'web', reviewer_location_state: 'CA', reviewer_location_city: 'Yuba'}
      stub_put(path(10)).with(:query => {'nonce' => @nonce, 'review' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      updated_review = Lobbyist::Review.update(10, params)
      updated_review.review_summary.should == 'New Review Summary'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/reviews/#{id}.json"
    else
      "/v1/reviews.json"
    end
  end
  
  def params
    {
      "company_id"              => "127",
      "contact_id"              => "1",
      "review_summary"          => "New Review Summary",
      "review_body"             => "This is the body.",
      "review_status"           => "publish",
      "total_score"             => "1.0",
      "source"                  => "web",
      "reviewer_location_state" => "CA",
      "reviewer_location_city"  => "Yuba",
    }
  end
  
end