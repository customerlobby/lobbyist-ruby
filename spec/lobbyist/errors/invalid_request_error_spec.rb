require 'spec_helper'

module Lobbyist
  describe InvalidRequestError do
    before do
      @error = Lobbyist::InvalidRequestError.new('Bad Request', {id: 5}, 401, 'HTTP Body', 'JSON Body')
    end
    
    describe 'read only attributes' do
      it 'should respond to message' do
        @error.message.should == 'Bad Request'
      end
      
      it 'should respond tp param' do
        @error.param.should == {id: 5}
      end
      
      it 'should respond to http_status' do
        @error.http_status.should == 401
      end
      
      it 'should respond to http_body' do
        @error.http_body.should == 'HTTP Body'
      end
      
      it 'should respond to json_body' do
        @error.json_body.should == 'JSON Body'
      end
    end
  end
end