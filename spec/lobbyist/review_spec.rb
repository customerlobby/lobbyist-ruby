require 'spec_helper'

describe Lobbyist::Review do
  
  describe ':list' do
    it 'should get the list of reviews' do
      list = Lobbyist::Review.list({'company_id' => '127', 'status' => 'publish'})
      list.should_not be_nil
      list.should be_a(Array)
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      expect{Lobbyist::Review.find('invalid')}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review' do
      review = Lobbyist::Review.find(206002)
      review.should_not be_nil
      review.should be_a(Lobbyist::Review)
      review.contact.should_not be_nil
      review.contact.should be_a(Lobbyist::Contact)
      review.company.should_not be_nil
      review.company.should be_a(Lobbyist::Company)
      review.comments.should_not be_nil
      review.comments.should be_a(Array)
      review.challenge.should_not be_nil
      review.challenge.should be_a(Lobbyist::ReviewChallenge)
      review.topics.should_not be_nil
      review.topics.should be_a(Array)
      review.withdrawal_request.should_not be_nil
      review.withdrawal_request.should be_a(Lobbyist::ReviewWithdrawalRequest)
    end
  end

  describe ':create' do
    
    after do
      Lobbyist::Review.destroy(@review.review_id)
    end
    
    it 'should create a new review' do
      @review = Lobbyist::Review.create(params)
      @review.company.company_id.should == 127
      @review.review_summary.should == "New Review Summary"
      @review.review_body.should == "This is the body."
    end
    
  end
  
  describe ':update' do
    before do
      @created = Lobbyist::Review.create(params)
    end

    after do
      Lobbyist::Review.destroy(@created.review_id)
    end
    
    it 'should update the review' do
      updated_review = Lobbyist::Review.update(@created.review_id, {'review_summary' => 'This is a new summary.'})
      updated_review.review_summary.should == 'This is a new summary.'
    end
  end
  
  def params
    {
      "company_id"              => "127",
      "contact_id"              => "1",
      "review_date"             => "#{Time.now}",
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