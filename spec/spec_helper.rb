require 'simplecov'

SimpleCov.start

require 'lobbyist'
require 'rspec'

def universal_client
  @client ||= Lobbyist::Client.new(
    :api_key => 'Jz43pwlU1rb4ewhgltWO',
    :api_secret => '5d0216d4f00155d64c2e3cc5985f868bfe069b3171d0cbd6a03ef8647dbc44f5'
  )
  @client
end
