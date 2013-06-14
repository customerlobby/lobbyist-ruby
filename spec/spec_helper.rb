require 'simplecov'

SimpleCov.start

require 'lobbyist'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
end

def stub_get(path)
  stub_request(:get, Lobbyist.api_base + path)
end

def stub_post(path)
  stub_request(:post, Lobbyist.api_base + path)
end

def stub_put(path)
  stub_request(:put, Lobbyist.api_base + path)
end

def stub_delete(path)
  stub_request(:delete, Lobbyist.api_base + path)
end

def set_headers(method, path, params)
  {
    'Accept'=>'application/json', 
    'Authorization'=> Lobbyist::Base.auth_header(method, path, params),
    'Content-Length'=>'0', 
    'User-Agent'=>'Faraday v0.8.7'
  }  
end
