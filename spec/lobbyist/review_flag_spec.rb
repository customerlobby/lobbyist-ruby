require 'spec_helper'

describe Lobbyist::ReviewFlag do
  
  describe ':list' do
    it 'should get a list of review flags' do
      list = Lobbyist::ReviewFlag.list()
      list.should be_a(Array)
      list[0].flagged.should be_true
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      expect{Lobbyist::ReviewFlag.find('invalid')}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found review flag' do
      flag = Lobbyist::ReviewFlag.find(1)
      flag.should_not be_nil
      flag.should be_a(Lobbyist::ReviewFlag)
      flag.review.topics.should_not be_nil
      flag.review.topics.should be_a(Array)
    end
  end
  
  describe ':create' do
    after do
      @created.delete
    end
    
    it 'should create a new review flag' do
      @created = Lobbyist::ReviewFlag.create({
        'review_id'  => '205962',
        'flagged'    => '1',
        'flagger_ip' => '127.0.0.1',
        'note'  => 'This review is flagged because I say so!',
        'category'   => 'customer_created'
      })
      @created.should_not be_nil
      @created.should be_a(Lobbyist::ReviewFlag)
      @created.flagged.should be_true
      @created.note.should == 'This review is flagged because I say so!'
      @created.review.should_not be_nil
      @created.review.review_id.should == 205962
    end
  end
  
  describe '#update' do
    before do
      @flag = Lobbyist::ReviewFlag.create({'review_id' => '205962','flagged' => '1','flagger_ip' => '127.0.0.1','note' => 'This review is flagged because I say so!','category' => 'customer_created'})
    end
    
    after do
      @flag.delete
    end
    
    it 'should update the review flag' do
      @flag.note = 'This is a new note.'
      updated_flag = @flag.update
      updated_flag.note.should == 'This is a new note.'
    end
  end
  
end