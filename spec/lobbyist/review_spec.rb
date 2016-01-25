require 'spec_helper'

describe Lobbyist::Review do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of reviews' do
      VCR.use_cassette('review_list') do
        params = {'nonce' => @nonce, 'company_id' => '148', 'status' => 'publish'}
        reviews = Lobbyist::Review.list(params)

        expect(reviews).to_not be_nil
        expect(reviews).to be_a(Lobbyist::Collection)
        expect(reviews.count).to eq(21)
        expect(reviews.elements[0].total_score).to eq(1.0)
        expect(reviews.elements[18].total_score).to eq(0.8)
      end
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('review_find_error') do
        expect{Lobbyist::Review.find(2)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found review' do
      VCR.use_cassette('review_find') do
        review = Lobbyist::Review.find(10040)

        expect(review).to_not be_nil
        expect(review).to be_a(Lobbyist::Review)
        expect(review.ip_address).to eq('76.126.198.98')
      end
    end
  end

  describe ':create' do
    it 'should create a new review' do
      VCR.use_cassette('review_create') do
        review = Lobbyist::Review.create(create_params)

        expect(review.review_summary).to eq("This is the summary.")
        expect(review.review_body).to eq("This is the review.")
      end
    end
  end

  describe ':update' do
    it 'should update the review' do
      VCR.use_cassette('review_update') do
        updated_review = Lobbyist::Review.update(10117, params)
        expect(updated_review.review_summary).to eq('New Review Summary')
      end
    end
  end
  
  def params
    {
      "company_id"              => "127",
      "contact_id"              => "23",
      "review_summary"          => "New Review Summary",
      "review_body"             => "This is the body.",
      "review_status"           => "publish",
      "total_score"             => "1.0",
      "source"                  => "web",
      "reviewer_location_state" => "CA",
      "reviewer_location_city"  => "Yuba",
    }
  end

  def create_params
    {
      review:
        {
          "review_summary"=>"This is the summary.",
          "review_body"=>"This is the review.",
          "company_id"=>"127",
          "source"=>"web",
          "total_score"=>"0.0",
          "reviewer_location_city"=>"Berkeley",
          "reviewer_location_state"=>"CA",
          "ip_address"=>"127.0.0.1",
          "xref_topics_attributes"=>[
            {
              "rating"=>"1.0",
              "review_topic_id"=>"320"
            },
            {
              "rating"=>"1.0",
              "review_topic_id"=>"321"
            },
            {
              "rating"=>"1.0",
              "review_topic_id"=>"322"
            }
          ]
        },
      contact:
        {
          "first_name"=>"Dan",
          "last_name"=>"Tenham",
          "city"=>"Berkeley",
          "state"=>"CA",
          "email"=>"dan.tenham@gmail.com"
        },
      contact_suggestions: [
          {
            "suggestion_topic_id"=>"319",
            "suggestion_answer"=>""
          },
          {
            "suggestion_topic_id"=>"386",
            "suggestion_answer"=>""
          },
          {
            "suggestion_topic_id"=>"387",
            "suggestion_answer"=>""
          }
        ],
      "nonce"=>"2015-11-23T22:44:28Z"
    }
  end
end