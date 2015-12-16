require 'spec_helper'

describe Lobbyist::ChallengeCommunication do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should return the list of challenge_communications' do
      VCR.use_cassette('challenge_communication_list') do
        challenge = Lobbyist::ChallengeCommunication.list({review_challenge_id: 577})

        expect(challenge).to_not be_nil
        expect(challenge).to be_a(Array)
        expect(challenge[0].review_challenge_id).to eq(577)
        expect(challenge[0].admin_user_id).to eq(25)
      end
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('challenge_communication_find_error') do
        expect{Lobbyist::ChallengeCommunication.find(2)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found review_withdrawal_request' do
      VCR.use_cassette('challenge_communication_find') do
        communication = Lobbyist::ChallengeCommunication.find(17)

        expect(communication).to_not be_nil
        expect(communication).to be_a(Lobbyist::ChallengeCommunication)
        expect(communication.communication_body).to eq('not a customer')
      end
    end
  end

  describe ':create' do

    it 'should create a new challenge_communication' do
      VCR.use_cassette('challenge_communication_create') do
        communication = Lobbyist::ChallengeCommunication.create(params)

        expect(communication).to_not be_nil
        expect(communication).to be_a(Lobbyist::ChallengeCommunication)
        expect(communication.communication_body).to eq("You can't touch this.")
      end
    end

  end

  describe ':find_by_email_key' do
    it 'should return the found challenge_communication' do
      VCR.use_cassette('challenge_communication_find_by_email_key') do
        communication = Lobbyist::ChallengeCommunication.find_by_email_key('01148011a5324106')

        expect(communication).to_not be_nil
        expect(communication).to be_a(Lobbyist::ChallengeCommunication)
        expect(communication.email_key).to eq('01148011a5324106')
      end
    end
  end
  
  def params
    {
      "review_challenge_id"     => 577,
      "communication_body"      => "You can't touch this."
    }
  end
  
end