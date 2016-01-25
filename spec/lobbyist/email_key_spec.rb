require 'spec_helper'

describe Lobbyist::EmailKey do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':find_by_key' do
    it 'should find the matching email key record' do
      VCR.use_cassette('email_key_find_by_key') do
        key = Lobbyist::EmailKey.find_by_key('WgqwRDnU5w_uvyoZYqHGfg')

        expect(key).to be_a(Lobbyist::EmailKey)
        expect(key.action).to eq('info_reviewer')
      end
    end
    
  end
  
end
