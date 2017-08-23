require 'spec_helper'

describe Lobbyist::V2::ReviewConfirmation do

  describe '#update' do
    it 'should update the review_confirmation' do
      VCR.use_cassette('v2/review_confirmation_update') do
        new_status = 'confirmed'
        initial_confirmation = Lobbyist::V2::ReviewConfirmation.find_by_confirmation_key('bbb')
        expect(initial_confirmation.status).to eq('sent')
        Lobbyist::V2::ReviewConfirmation.update(1, 127, disposition: new_status, review_confirmation: {from_ip_address: ''})
        updated_confirmation = Lobbyist::V2::ReviewConfirmation.find_by_confirmation_key('bbb')
        expect(updated_confirmation.status).to eq(new_status)
      end
    end
  end

end
