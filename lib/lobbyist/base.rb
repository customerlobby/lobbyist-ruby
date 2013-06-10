module Lobbyist
  class Base
    
    def initialize(attributes)
      attributes.each do |k,v|
        self.send "#{k}=", v
      end
    end
    
    protected
    
    def self.create_from_response(response)
      if response.is_a?(Array)
        list = []
        response.each do |element|
          list << self.new(element)
        end
        return list
      else
        self.new(response)
      end
    end
    
    private
    
    def self.get(path, params = {})
      puts "Params are: #{params}"
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
      handle_response do
        http.post do |request|
          request.url path, params
          request.headers['Accept'] = 'application/json'
          request.headers['Authorization'] = auth_header('post', path, params)
        end
      end
    end

    def self.put(path, params = {})
      add_nonce(params)
      handle_response do
        http.put do |request|
          request.url path, params
          request.headers['Accept'] = 'application/json'
          request.headers['Authorization'] = auth_header('put', path, params)
        end
      end
    end
    
    def self.delete(path, params = {})
      add_nonce(params)
      handle_response do
        http.delete do |request|
          request.url path, params
          request.headers['Accept'] = 'application/json'
          request.headers['Authorization'] = auth_header('delete', path, params)
        end
      end
    end
    
    def self.add_nonce(params)
      params.merge!({'nonce' => Time.now.utc.to_s})
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
        raise Lobbyist::Error::BadRequest.from_response(response)
      when 401
        raise Lobbyist::Error::Unauthorized.from_response(response)
      when 403
        raise Lobbyist::Error::Forbidden.from_response(response)
      when 404
        raise Lobbyist::Error::NotFound.from_response(response)
      when 412
        raise Lobbyist::Error::PreconditionFailed.from_response(response)
      when 422
        raise Lobbyist::Error::UnprocessableEntity.from_response(response)
      else
        response = MultiJson.load(response.body)
        return response
      end
    rescue MultiJson::DecodeError
      raise Lobbyist::Error::DecodeError.new "Unparsable Response: #{response.body}"
    end

  end
end