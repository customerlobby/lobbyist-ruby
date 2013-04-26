require 'spec_helper'

describe Lobbyist::MemberCalls do
  
  describe ':list' do
    it 'should get a list of member calls as specified by the parameter' do
      list = Lobbyist::MemberCalls.list(25, {'scope' => 'current_calls'})
      list.should be_a(Array)
    end
  end
end