require 'spec_helper'

describe Lobbyist::AccountLevel do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of account levels' do
      VCR.use_cassette('account_level_list') do
        account = Lobbyist::AccountLevel.list({'nonce' => @nonce})

        expect(account).to_not be_nil
        expect(account).to be_a(Array)
        expect(account[0].account_class).to eq('basic')
      end
    end
  end
  
end
