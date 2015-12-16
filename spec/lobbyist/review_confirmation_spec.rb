require 'spec_helper'

describe Lobbyist::ReviewConfirmation do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':update' do
    it 'should update the review_confirmation' do
      VCR.use_cassette('review_confirmation_update') do
        updated_confirmation = Lobbyist::ReviewConfirmation.update(3, params)
        expect(updated_confirmation.status).to eq('confirmed')
      end
    end
  end
  
  describe ':find_by_confirmation_key' do
    it 'should return the found review_confirmation' do
      VCR.use_cassette('review_confirmation_find_by_confirmation_key') do
        confirmation = Lobbyist::ReviewConfirmation.find_by_confirmation_key('K9KNdTCc7v9GUNcV2dTNSg')
      
        expect(confirmation).to_not be_nil
        expect(confirmation).to be_a(Lobbyist::ReviewConfirmation)
        expect(confirmation.status).to eq('sent')
        expect(confirmation.confirmation_key).to eq('K9KNdTCc7v9GUNcV2dTNSg')
      end
    end
  end
  
  def params
    {
      "disposition" => 'confirmed',
      "review_confirmation" => {
        "id"                      => 3,
        "review_id"               => 292811,
        "confirmation_type"       => "email",
        "confirmation_key"        => "3Pha2M_0zFlQ9juJNDJU4A",
        "status"                  => "confirmed",
      }
    }
  end
  
end