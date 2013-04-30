require 'spec_helper'

describe Lobbyist::Review do
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      expect{Lobbyist::Review.find('invalid')}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review' do
      review = Lobbyist::Review.find(206002)
      review.should_not be_nil
      review.should be_a(Lobbyist::Review)
      review.topics.should_not be_nil
      review.topics.should be_a(Array)
    end
  end
  
  describe '#update' do
    it 'should update the review' do
      review = Lobbyist::Review.find(206002)
      summary = review.review_summary
      review.review_summary = 'This is a new summary.'
      updated_review = review.update
      updated_review.review_summary.should == 'This is a new summary.'
      updated_review.review_summary = summary
      updated_review.update
    end
  end
  
end