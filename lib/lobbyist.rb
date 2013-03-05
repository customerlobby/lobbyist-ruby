# Customer Lobby Ruby API Client.

require 'cgi'
require 'rubygems'
require 'openssl'

require 'rest_client'
require 'json'

# Version
require 'lobbyist/version'

# Resources
require 'lobbyist/api_resource'
require 'lobbyist/contact'

# Errors
require 'lobbyist/errors/lobbyist_error'
require 'lobbyist/errors/api_error'
require 'lobbyist/errors/api_connection_error'
require 'lobbyist/errors/authentication_error'
require 'lobbyist/errors/invalid_request_error'

module Lobbyist
  @@api_key = nil
  @@api_secret = nil
  @@api_base = 'http://api.customerlobby.com';
  @@api_version = nil
  
  def self.api_url(url='')
    @@api_base + url
  end
  
  def self.api_key=(api_key)
    @@api_key = api_key
  end
  
  def self.api_key
    @@api_key
  end
  
  def self.api_secret=(api_secret)
    @@api_secret = api_secret
  end
  
  def self.api_secret
    @@api_secret
  end
  
  def self.api_base
    @@api_base
  end
  
  def self.api_version=(version)
    @@api_version = version
  end
  
  def self.api_version
    @@api_version
  end
  
  def self.request(method, url, id = nil, params = {}, headers = {})
    # TODO: Verify the URL's and Emails in the following error messages.
    raise AuthenticationError.new('No API key provided.  (HINT: set your API key using "Lobbyist.api_key = <API-KEY>".  You can find your API keys from the Customer Lobby web interface. See http://www.customerlobby.com/api for details, or email support@customerlobby.com if you have any questions.') unless @@api_key
    raise AuthenticationError.new('No API secret provided.  (HINT: set your API secret using "Lobbyist.api_secret = <API-SECRET>".  You can find your API keys from the Customer Lobby web interface. See http://www.customerlobby.com/api for details, or email support@customerlobby.com if you have any questions.') unless @@api_secret

    params['nonce'] = Time.now.utc.to_s

    url = self.api_url(url)
    case method.to_s.downcase.to_sym
    when :get, :head, :delete
      # Make params into GET parameters
      if params && params.count > 0
        query_string = params.collect{|key, value| "#{key}=#{CGI.escape(value.to_s)}"}.join('&')
        url += "?#{query_string}"
      end
      payload = nil
      headers = {
        :content_type => 'application/x-www-form-urlencoded'
      }.merge(headers)
    else
      payload = JSON.generate(params)
      headers = {
        :content_type => 'application/json'
      }.merge(headers)
    end

    headers = {
      :authorization => "Authorization: Token token=\"#{@@api_key}\", signature=\"#{generate_signature(params, method, id)}\"",
    }.merge(headers)

    if self.api_version
      headers[:lobbyist_version] = self.api_version
    end

    opts = {
      :method => method,
      :url => url,
      :headers => headers,
      :open_timeout => 30,
      :payload => payload,
      :timeout => 80
    }

    begin
      response = execute_request(opts)
    rescue SocketError => e
      self.handle_restclient_error(e)
    rescue NoMethodError => e
      # Work around RestClient bug
      if e.message =~ /\WRequestFailed\W/
        e = APIConnectionError.new('Unexpected HTTP response code')
        self.handle_restclient_error(e)
      else
        raise
      end
    rescue RestClient::ExceptionWithResponse => e
      if rcode = e.http_code and rbody = e.http_body
        self.handle_api_error(rcode, rbody)
      else
        self.handle_restclient_error(e)
      end
    rescue RestClient::Exception, Errno::ECONNREFUSED => e
      self.handle_restclient_error(e)
    end

    rbody = response.body
    rcode = response.code
    begin
      resp = JSON.parse(rbody)
    rescue JSON::ParserError
      raise APIError.new("Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})", rcode, rbody)
    end

    resp
  end

  private

  def self.generate_signature(params, method, id = nil)
    params['method'] = method.to_s.downcase
    if id
      params['id'] = id
    end

    sorted = params.sort
    
    signature = OpenSSL::HMAC.hexdigest('sha256', @@api_secret, message(sorted))

    # Remove parameters that will be generated automaticaly by Rails.
    params.delete('method')
    
    return signature;
  end
  
  def self.message(params)
    message = ''
    params.each_index do |x|
      message << '&' unless x == 0
      message << "#{params[x][0]}=#{params[x][1]}"
    end
    return CGI.escape(message)
  end
  
  def self.execute_request(opts)
    RestClient::Request.execute(opts)
  end

  def self.handle_api_error(rcode, rbody)
    begin
      error_obj = JSON.parse(rbody)
      error = error_obj[:error] or raise LobbyistError.new # escape from parsing
    rescue JSON::ParserError, LobbyistError
      raise APIError.new("Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})", rcode, rbody)
    end

    case rcode
    when 400, 404, 412 then
      raise invalid_request_error(error, rcode, rbody, error_obj)
    when 401
      raise authentication_error(error, rcode, rbody, error_obj)
    else
      raise api_error(error, rcode, rbody, error_obj)
    end
  end

  def self.invalid_request_error(error, rcode, rbody, error_obj)
    InvalidRequestError.new(error[:message], error[:param], rcode, rbody, error_obj)
  end

  def self.authentication_error(error, rcode, rbody, error_obj)
    AuthenticationError.new(error[:message], rcode, rbody, error_obj)
  end

  def self.api_error(error, rcode, rbody, error_obj)
    APIError.new(error[:message], rcode, rbody, error_obj)
  end

  def self.handle_restclient_error(e)
    case e
    when RestClient::ServerBrokeConnection, RestClient::RequestTimeout
      message = "Could not connect to Customer Lobby (#{@@api_base}).  Please check your internet connection and try again.  If this problem persists, you should let us know at support@customerlobby.com."
    when SocketError
      message = "Unexpected error communicating when trying to connect to Customer Lobby.  HINT: You may be seeing this message because your DNS is not working.  To check, try running 'host customerlobby.com' from the command line."
    else
      message = "Unexpected error communicating with Customer Lobby.  If this problem persists, let us know at support@customerlobby.com."
    end
    message += "\n\n(Network error: #{e.message})"
    raise APIConnectionError.new(message)
  end
end
