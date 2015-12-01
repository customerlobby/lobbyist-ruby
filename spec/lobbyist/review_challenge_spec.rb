require 'spec_helper'

describe Lobbyist::ReviewChallenge do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should return the found review_challenge' do
      VCR.use_cassette('review_challenge_list') do
        challenge = Lobbyist::ReviewChallenge.list

        expect(challenge).to_not be_nil
        expect(challenge).to be_a(Lobbyist::Collection)
        expect(challenge.count).to eq(16)
        expect(challenge.elements[0].status).to eq('requested')
        expect(challenge.elements[0].review_id).to eq(635585)
      end
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('review_challenge_find_error') do
        expect{Lobbyist::ReviewChallenge.find(998)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found review_challenge' do
      VCR.use_cassette('review_challenge_find') do
        challenge = Lobbyist::ReviewChallenge.find(19)

        expect(challenge).to_not be_nil
        expect(challenge).to be_a(Lobbyist::ReviewChallenge)
        expect(challenge.status).to eq('approved')
      end
    end
  end

  def params
    {
      "review_id"                 => 10055,
      "review_challenge" => {
        "reason"                  => 'not_a_customer',
        "status"                  => "requested",
      },
      "communication" => {
        "communication_body"    => 'New communication text',
        "admin_user_id"         => '1',
        "user_type"             => 'AdminUser'
      }
    }
  end
  
end