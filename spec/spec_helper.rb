require 'simplecov'

SimpleCov.start

require 'lobbyist'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
end


def stub_put(path)
  stub_request(:put, Lobbyist.api_base + path)
end

def set_headers(method,path,params)
  token_string = Lobbyist::Base.auth_header('put',path,params)
  headers = {
    'Accept'=>'application/json', 
    'Authorization'=> token_string, 
    'Content-Length'=>'0', 
    'User-Agent'=>'Faraday v0.8.7'
  }  
  
  return headers
end
