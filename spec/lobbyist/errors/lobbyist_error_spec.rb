require 'spec_helper'

module Lobbyist
  describe LobbyistError do
    
    before do
      @error = Lobbyist::LobbyistError.new('Not Found Error', 404, 'HTTP Body', 'JSON Body')
    end

    describe 'read only attributes' do
      it 'should respond to message' do
        @error.message.should == 'Not Found Error'
      end
      
      it 'should respond to http_status' do
        @error.http_status.should == 404
      end
      
      it 'should respond to http_body' do
        @error.http_body.should == 'HTTP Body'
      end
      
      it 'should respond to json_body' do
        @error.json_body.should == 'JSON Body'
      end
    end
    
    describe '#to_s' do
      it 'renders the error status message' do
        @error.to_s.should == "(Status 404) Not Found Error"
      end
    end

  end
end