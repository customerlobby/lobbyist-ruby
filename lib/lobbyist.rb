require 'lobbyist/base'
require 'lobbyist/basic_auth'
require 'lobbyist/member_calls'
require 'lobbyist/version'


module Lobbyist
  
  @@api_base = 'https://api.customerlobby.com'
  @@api_key = nil
  @@api_secret = nil
  
  def self.api_base
    @@api_base
  end

  def self.api_base=(base)
    @@api_base = base
  end
  
  def self.api_key
    @@api_key ||= ENV['LOBBYIST_API_KEY']
  end
  
  def self.api_key=(key)
    @@api_key = key
  end
  
  def self.api_secret
    @@api_secret ||= ENV['LOBBYIST_API_SECRET']
  end
  
  def self.api_secret=(secret)
    @@api_secret = secret
  end
  
end