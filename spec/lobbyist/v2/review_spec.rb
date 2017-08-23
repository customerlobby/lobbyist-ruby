require 'spec_helper'

describe Lobbyist::V2::Review do

  describe '#find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('v2/review_find_error') do
        expect{Lobbyist::V2::Review.find(0, 127)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found review' do
      VCR.use_cassette('v2/review_find') do
        review = Lobbyist::V2::Review.find(10050, 127)

        expect(review).to_not be_nil
        expect(review).to be_a(Lobbyist::V2::Review)
        expect(review.review_topics.size).to eq(2)
        expect(review.contact.contact_id).to eq(2081569)
      end
    end
  end
end
