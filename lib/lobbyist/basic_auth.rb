require 'openssl'

module Lobbyist
  class BasicAuth
    
    def self.header(method, params, credentials)
      "Token token=\"#{credentials[:api_key]}\", signature=\"#{generate_signature(method, params, credentials)}\""
    end
    
    private
    
    def self.generate_signature(method, params, credentials)
      params['method'] = method.to_s.downcase

      sorted = params.with_indifferent_access.sort

      signature = OpenSSL::HMAC.hexdigest('sha256', credentials[:api_secret], message(sorted))

      # Remove parameters that will be generated automaticaly by Rails.
      params.delete('method')
      params.delete('id')
      params.delete('activation_code')
      params.delete('key')
      
      return signature
    end

    def self.message(params)
      message = params.map {|x| [x[0].to_s,x[1].to_s] * "="} * "&"
      Lobbyist::Base.last_message = message
      return CGI.escape(message)
    end
    
  end
end