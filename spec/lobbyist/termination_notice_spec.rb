require 'spec_helper'

describe Lobbyist::TerminationNotice do
  
  describe ':list' do
    it 'should get a list of termination notices' do
      list = Lobbyist::TerminationNotice.list()
      list.should be_a(Array)
      list[0].dismissed.should == false
    end
    
    it 'should get a list of dismissed notices' do
      list = Lobbyist::TerminationNotice.list({'dismissed_list' => 'true'})
      list.should be_a(Array)
      list[0].dismissed.should == true
    end
  end
  
  describe ':dismiss' do
    
    it 'should update a termination notice' do
      notice = Lobbyist::TerminationNotice.dismiss({'company_id' => '17175'})
      notice.should_not be_nil
      notice.should be_a(Lobbyist::TerminationNotice)
      notice.dismissed.should == true
    end
  end
  
end
