require 'spec_helper'

describe Lobbyist::MemberCall do
  
  describe ':list' do
    it 'should fail with status 412 if required parameters are not sent' do
      expect{Lobbyist::MemberCall.list(152)}.to raise_error(Lobbyist::Error::PreconditionFailed)
      expect{Lobbyist::MemberCall.list(nil, {'scope' => 'current_calls'})}.to raise_error(Lobbyist::Error::PreconditionFailed)
    end
      
    it 'should get a list of completed calls' do
      list = Lobbyist::MemberCall.list(152, {'scope' => 'recently_completed'})
      list.should be_a(Array)
      list[0].status.should == 'completed'
    end
    
    it 'should get a list of queued calls' do
      list = Lobbyist::MemberCall.list(152, {'scope' => 'current_calls'})
      list.should be_a(Array)
      list[0].status.should == 'queued'
    end
    
    it 'should get a list of pending calls' do
      list = Lobbyist::MemberCall.list(152, {'scope' => 'pending_calls'})
      list.should be_a(Array)
      list[0].status.should == 'new'
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      expect{Lobbyist::MemberCall.find('invalid')}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found member call' do
      call = Lobbyist::MemberCall.find(1)
      call.should_not be_nil
      call.should be_a(Lobbyist::MemberCall)
    end
  end
  
  describe ':update' do
    before do
      @call = Lobbyist::MemberCall.find(1)
    end
    
    it 'should update the member call' do
      old_notes = @call.notes
      @call.notes = 'This is the new note.'
      updated_call = Lobbyist::MemberCall.update(@call.id, {'notes' => 'This is the new note.'})
      updated_call.should_not be_nil
      updated_call.should be_a(Lobbyist::MemberCall)
      updated_call.notes.should == 'This is the new note.'
      Lobbyist::MemberCall.update(@call.id, {'notes' => old_notes})
    end
  end
  
  describe '#enqueue' do
    after do
      Lobbyist::MemberCall.dequeue(10614)
    end
    
    it 'should assign the admin user to the call' do
      updated_call = Lobbyist::MemberCall.enqueue(10614, 152)
      updated_call.admin_user_id.should == 152
      updated_call.status.should == 'queued'
    end
  end

  describe '#dequeue' do
    before do
      Lobbyist::MemberCall.enqueue(10614, 152)
    end
    
    it 'should unassign the admin user' do
      updated_call = Lobbyist::MemberCall.dequeue(10614)
      updated_call.admin_user_id.should == nil
      updated_call.status.should == 'new'
    end
  end
  
end