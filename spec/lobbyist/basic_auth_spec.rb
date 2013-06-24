require 'spec_helper'

describe Lobbyist::BasicAuth do
  
  # describe ':message' do
  #   it 'should url encode the parameters' do
  #     nonce = Time.now.utc.to_s
  #     params = {'nonce' => nonce}
  #     result = Lobbyist::BasicAuth.send(:message, params)
  #     result.should == CGI.escape("'nonce'='#{nonce}'")
  #   end
  #   
  #   it 'should convert symbol keys to strings' do
  #     nonce = Time.now.utc.to_s
  #     params = {:nonce => nonce}
  #     result = Lobbyist::BasicAuth.send(:message, params)
  #     result.should == CGI.escape("'nonce'='#{nonce}'")
  #   end
  #   
  #   it 'should convert values to strings' do
  #     nonce = Time.now.utc.to_s
  #     params = {:nonce => nonce, :id => 12345}
  #     result = Lobbyist::BasicAuth.send(:message, params)
  #     puts "UN: #{CGI.unescape(result)}"
  #     result.should == CGI.escape("'nonce'='#{nonce}'&'id'='12345'")
  #   end
  #   
  #   it 'should convert values in embedded hashes to strings' do
  #     nonce = Time.now.utc.to_s
  #     params = {:nonce => nonce, :id => 12345, :company => {:id => 54321}}
  #     result = Lobbyist::BasicAuth.send(:message, params)
  #     puts "UN: #{CGI.unescape(result)}"
  #     result.should == CGI.escape("'nonce'='#{nonce}'&'id'='12345'&'company'={'id'=>'54321'}")
  #   end
  # end
end