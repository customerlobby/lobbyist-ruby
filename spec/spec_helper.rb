require 'simplecov'

SimpleCov.start

require 'lobbyist'
require 'rspec'
require 'vcr'

RSpec.configure do |config|
  config.color = true
  
  config.before(:suite) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "Jz43pwlU1rb4ewhgltWO"
    Lobbyist.api_secret  = "5d0216d4f00155d64c2e3cc5985f868bfe069b3171d0cbd6a03ef8647dbc44f5"
  end
  
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :faraday
    c.ignore_localhost = false
  end
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
    'User-Agent'=>'Faraday v0.9.2'
  }  
end

def set_v2_headers
  {
    'Accept'=>'application/json', 
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
    'Authorization'=>'Token token="jQuchd091cns"', 
    'User-Agent'=>'Faraday v0.9.2'
  }
end
