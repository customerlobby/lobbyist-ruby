require 'spec_helper'

describe Lobbyist::TerminationNotice do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get a list of termination notices' do
      VCR.use_cassette('termination_notices_list', match_requests_on: [:host, :path]) do
        list = Lobbyist::TerminationNotice.list()
        expect(list).to be_a(Array)
        expect(list[0].dismissed).to eq(false)
      end
    end

    it 'should get a list of dismissed notices' do
      VCR.use_cassette('termination_notices_list', match_requests_on: [:host, :path]) do
        list = Lobbyist::TerminationNotice.list()
        expect(list).to be_a(Array)
        expect(list[1].dismissed).to eq(true)
      end
    end
  end
  
  describe ':dismiss' do
    
    it 'should update a termination notice' do
      VCR.use_cassette('termination_notices_dismiss', match_requests_on: [:host,:path]) do
        notice = Lobbyist::TerminationNotice.dismiss(7639)
        expect(notice).to_not be_nil
        expect(notice).to be_a(Lobbyist::TerminationNotice)
        expect(notice.dismissed).to eq(true)
      end
    end
  end
  
end
