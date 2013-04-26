module Lobbyist
  class Base
    
    def to_hash
      self.instance_variables.inject({}) { |hash, val| hash[val[1..-1]] = self.instance_variable_get(val); hash }
    end

    private
    
    def self.get(path, params = {})
      add_nonce(params)
      handle_response do
        http.get do |request|
          request.url path, params
          request.headers['Accept'] = 'application/json'
          request.headers['Authorization'] = auth_header('get', path, params)
        end
      end
    end
    
    def self.post(path, params = {})
      add_nonce(params)
      #HTTParty.post(path, :query => params, :headers => headers('post', path, params))
    end

    def self.put(path, params = {})
      add_nonce(params)
      #HTTParty.put(path, :query => params, :headers => headers('put', path, params))
    end
    
    def self.delete(path, params = {})
      add_nonce(params)
      #HTTParty.delete(path, :query => params, :headers => headers('delete', path, params))
    end
    
    def self.add_nonce(params)
      params.merge!({'nonce' => Time.now.utc.to_s})
    end
    
    def self.headers(method, path, params)
      {
        'Accept' => 'application/json',
        'Authorization' => auth_header(method, path, params)
      }
    end
      
    def self.auth_header(method, path, params = {})
      Lobbyist::BasicAuth.header(method, params, { api_key: Lobbyist.api_key, api_secret: Lobbyist.api_secret})
    end

    def self.http
      Lobbyist.http
    end

    def self.handle_response
      response = yield
      case response.status
      when 400
        raise Lobbyist::Error::BadRequest.new
      when 401
        raise Lobbyist::Error::Unauthorized.new
      when 403
        raise Lobbyist::Error::Forbidden.new
      when 404
        raise Lobbyist::Error::NotFound.new
      when '412'
        raise Lobbyist::Error::
      when '422'
        raise Lobbyist::Error::UnprocessableEntity.new
      else
        puts "Response body: #{response.body}"
        response = MultiJson.load(response.body).with_indifferent_access
      end
    rescue MultiJson::DecodeError
      raise Lobbyist::Error::DecodeError.new "Unparsable Response: #{response.body}"
    end

  end
end