require 'httparty'

module Lobbyist
  class Base
    include HTTParty
    
    def to_hash
      self.instance_variables.inject({}) { |hash, val| hash[val[1..-1]] = self.instance_variable_get(val); hash }
    end

    private
    
    def self._get(path, params = {})
      add_nonce(params)
      puts "Path: #{path}, Params: #{params}, Headers: #{headers('get', path, params)}"
      get(path, :query => params, :headers => headers('get', path, params))
    end
    
    def self._post(path, params = {})
      add_nonce(params)
      self.class.post(path, :query => params, :headers => headers('post', path, params))
    end

    def self._put(path, params = {})
      add_nonce(params)
      self.class.put(path, :query => params, :headers => headers('put', path, params))
    end
    
    def self._delete(path, params = {})
      add_nonce(params)
      self.class.delete(path, :query => params, :headers => headers('delete', path, params))
    end
    
    def self.add_nonce(params)
      params.merge!({'nonce' => Time.now.utc.to_s})
    end
    
    def self.headers(method, path, params)
      {
        'Accept' => 'application/json',
        'User-Agent' => "Lobbyist Ruby Gem #{Lobbyist::Version}",
        'Authorization' => auth_header(method, path, params)
      }
    end
      
    def self.auth_header(method, path, params = {})
      Lobbyist::BasicAuth.header(method, params, { api_key: Lobbyist.api_key, api_secret: Lobbyist.api_secret})
    end

  end
end