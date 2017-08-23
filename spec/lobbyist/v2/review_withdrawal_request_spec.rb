require 'spec_helper'

describe Lobbyist::V2::ReviewWithdrawalRequest do

  describe '#find_by_email_key' do
    it 'should return the found review_withdrawal_request' do
      VCR.use_cassette('v2/review_withdrawal_request_find_by_email_key') do
        key = 'yuyQTmTpTNHJZxZjAyIx4Q'
        withdrawal_request = Lobbyist::V2::ReviewWithdrawalRequest.find_by_email_key(key)

        expect(withdrawal_request).to_not be_nil
        expect(withdrawal_request).to be_a(Lobbyist::V2::ReviewWithdrawalRequest)
        expect(withdrawal_request.status).to eq('requested')
        expect(withdrawal_request.email_key).to eq(key)
      end
    end
  end

end
