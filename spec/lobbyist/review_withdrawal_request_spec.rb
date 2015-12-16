require 'spec_helper'

describe Lobbyist::ReviewWithdrawalRequest do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('review_withdrawal_request_find_exception') do
        expect{Lobbyist::ReviewWithdrawalRequest.find(998)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end
    
    it 'should return the found review_withdrawal_request' do
      VCR.use_cassette('review_withdrawal_request_find') do
        withdrawal_request = Lobbyist::ReviewWithdrawalRequest.find(9021)

        expect(withdrawal_request).to_not be_nil
        expect(withdrawal_request).to be_a(Lobbyist::ReviewWithdrawalRequest)
        expect(withdrawal_request.status).to eq('requested')
      end
    end
  end

  describe ':create' do
    it 'should create a new review' do
      VCR.use_cassette('review_withdrawal_request_create') do
        withdrawal_request = Lobbyist::ReviewWithdrawalRequest.create(params)

        expect(withdrawal_request.status).to eq("requested")
        expect(withdrawal_request.note).to eq("Requesting a withdrawal")
      end
    end
  end

  describe ':update' do
    it 'should update the review_withdrawal_request' do
      VCR.use_cassette('review_withdrawal_request_update') do
        updated_withdrawal_request = Lobbyist::ReviewWithdrawalRequest.update(9001, params('accepted'))
        expect(updated_withdrawal_request.note).to eq('Requesting a withdrawal')
      end
    end
  end

  describe ':find_by_email_key' do
    it 'should return the found review_withdrawal_request' do
      VCR.use_cassette('review_withdrawal_request_find_by_email_key') do
        withdrawal_request = Lobbyist::ReviewWithdrawalRequest.find_by_email_key('8bl_gi9KyVZT7IHmagfL7g')

        expect(withdrawal_request).to_not be_nil
        expect(withdrawal_request).to be_a(Lobbyist::ReviewWithdrawalRequest)
        expect(withdrawal_request.status).to eq('requested')
        expect(withdrawal_request.email_key).to eq('8bl_gi9KyVZT7IHmagfL7g')
      end
    end
  end

  def params(status = 'requested')
    {
      "id"                      => 1,
      "review_id"               => 20548,
      "status"                  => status,
      "request_date"            => Time.now.to_s,
      "note"                    => "Requesting a withdrawal",
    }
  end
  
end