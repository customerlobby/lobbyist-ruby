require 'spec_helper'

describe Lobbyist::V2::ChallengeCommunication do

  describe ':create' do

    it 'should create a new challenge_communication' do
      VCR.use_cassette('v2/challenge_communication_create') do
        communication = Lobbyist::V2::ChallengeCommunication.create(params['review_challenge_id'], params)

        expect(communication).to_not be_nil
        expect(communication).to be_a(Lobbyist::V2::ChallengeCommunication)
        expect(communication.communication_body).to eq(params['communication_body'])
      end
    end

  end

  describe ':find_by_email_key' do
    it 'should return the found challenge_communication' do
      VCR.use_cassette('v2/challenge_communication_find_by_email_key') do
        key = '01148011a5324106';
        communication = Lobbyist::V2::ChallengeCommunication.find_by_email_key(key)

        expect(communication).to_not be_nil
        expect(communication).to be_a(Lobbyist::V2::ChallengeCommunication)
        expect(communication.email_key).to eq(key)
      end
    end
  end

  def params
    {
      "review_challenge_id"     => 1,
      "communication_body"      => "You can't touch this."
    }
  end

end
