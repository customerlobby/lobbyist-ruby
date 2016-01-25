require 'spec_helper'

describe Lobbyist::ReviewFlag do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get a list of review flags' do
      VCR.use_cassette('review_flag_list') do
        list = Lobbyist::ReviewFlag.list({'nonce' => @nonce})

        expect(list).to be_a(Array)
        expect(list[0].flagged).to eq(true)
      end
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('review_flag_find_error') do
        expect{Lobbyist::ReviewFlag.find(888)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end
    
    it 'should return the found review flag' do
      VCR.use_cassette('review_flag_find') do
        flag = Lobbyist::ReviewFlag.find(899)
        expect(flag).to_not be_nil
        expect(flag).to be_a(Lobbyist::ReviewFlag)
      end
    end
  end
  
  describe ':create' do
    it 'should create a new review flag' do
      VCR.use_cassette('review_flag_create') do
        flag = Lobbyist::ReviewFlag.create(params)
        expect(flag).to_not be_nil
        expect(flag).to be_a(Lobbyist::ReviewFlag)
        expect(flag.flagged).to eq(true)
        expect(flag.note).to eq('This review is flagged because I say so!')
      end
    end
  end

  describe '#update' do
    it 'should update the review flag' do
      VCR.use_cassette('review_flag_update') do
        updated_flag = Lobbyist::ReviewFlag.update(9, params('Updated note with new and improved text.'))
        expect(updated_flag.note).to eq('Updated note with new and improved text.')
      end
    end
  end
  
  def params(note = 'This review is flagged because I say so!')
    {
      'review_id'  => '10055',
      'flagged'    => '1',
      'flagger_ip' => '127.0.0.1',
      'note'       => note,
      'category'   => 'customer_created'
    }
  end
end
