require 'spec_helper'

describe Lobbyist::MemberCall do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get a list of completed calls' do
      VCR.use_cassette('member_call_list_completed') do
        list = Lobbyist::MemberCall.list({'nonce' => @nonce, 'admin_user_id' => 415, 'scope' => 'recently_completed'})
        expect(list.elements).to be_a(Array)
        expect(list.elements[0].status).to eq('completed')
      end
    end
    
    it 'should get a list of queued calls' do
      VCR.use_cassette('member_call_list_queued') do
        list = Lobbyist::MemberCall.list({'nonce' => @nonce, 'admin_user_id' => 415, 'scope' => 'current_calls'})
        expect(list.elements).to be_a(Array)
        expect(list.elements[0].status).to eq('completed')
      end
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('member_call_find_error') do
        expect{Lobbyist::MemberCall.find(2)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found member call' do
      VCR.use_cassette('member_call_find') do
        call = Lobbyist::MemberCall.find(1)

        expect(call).to_not be_nil
        expect(call).to be_a(Lobbyist::MemberCall)
      end
    end
  end

  describe ':update' do
    it 'should update the member call' do
      VCR.use_cassette('member_call_update') do
        call = Lobbyist::MemberCall.update(3, {'notes' => 'This is the new note.'})

        expect(call).to_not be_nil
        expect(call).to be_a(Lobbyist::MemberCall)
        expect(call.notes).to eq('This is the new note.')
      end
    end
  end

  describe '#enqueue' do
    it 'should assign the admin user to the call' do
      VCR.use_cassette('member_call_enqueue') do
        updated_call = Lobbyist::MemberCall.enqueue(51441, 2)

        expect(updated_call.admin_user_id).to eq(2)
        expect(updated_call.status).to eq('queued')
      end
    end
  end

  describe '#dequeue' do
    it 'should unassign the admin user' do
      VCR.use_cassette('member_call_dequeue') do
        updated_call = Lobbyist::MemberCall.dequeue(48739)

        expect(updated_call.admin_user_id).to be_nil
        expect(updated_call.status).to eq('new')
      end
    end
  end
  
end
