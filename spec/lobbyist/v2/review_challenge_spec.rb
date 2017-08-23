require 'spec_helper'

describe Lobbyist::V2::ReviewChallenge do

  describe '#find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('v2/review_challenge_find_error') do
        expect{Lobbyist::V2::ReviewChallenge.find(0, 10050)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found review_challenge' do
      VCR.use_cassette('v2/review_challenge_find') do
        challenge = Lobbyist::V2::ReviewChallenge.find(1, 10050)

        expect(challenge).to_not be_nil
        expect(challenge).to be_a(Lobbyist::V2::ReviewChallenge)
        expect(challenge.status).to eq('requested')
        expect(challenge.review_id).to eq(10050)
      end
    end
  end

  describe '#update' do
    it 'should update a review_challenge' do
      VCR.use_cassette('v2/review_challenge_update') do
        new_status = 'approved'
        challenge = Lobbyist::V2::ReviewChallenge.update(1, 10050, status: new_status)

        expect(challenge).to_not be_nil
        expect(challenge).to be_a(Lobbyist::V2::ReviewChallenge)
        expect(challenge.status).to eq(new_status)
        expect(challenge.review_id).to eq(10050)
      end
    end
  end
end
