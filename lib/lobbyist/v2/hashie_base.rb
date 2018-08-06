module Lobbyist
  module V2
    class HashieBase
      def self.create_response(response)
        Hashie::Mash.new response
      end

      def self.get(path, params = {})
        handle_response do
          http.get do |request|
            request.url path, params
            request.headers['Accept']        = 'application/json'
            request.headers['Authorization'] = auth_header
          end
        end
      end

      def self.post(path, params = {}, multipart = false)
        handle_response do
          http.post do |request|
            request.url path
            request.body = params
            unless multipart
              request.headers['Accept']       = 'application/json'
              request.headers['Content-Type'] = 'application/json'
            end
            request.headers['Authorization'] = auth_header
          end
        end
      end

      def self.put(path, params = {})
        handle_response do
          http.put do |request|
            request.url path
            request.body                     = params
            request.headers['Accept']        = 'application/json'
            request.headers['Content-Type']  = 'application/json'
            request.headers['Authorization'] = auth_header
          end
        end
      end

      def self.delete(path, params = {})
        handle_response do
          http.delete do |request|
            request.url path, params
            request.headers['Accept']        = 'application/json'
            request.headers['Authorization'] = auth_header
          end
        end
      end

      def self.auth_header
        "Token token=\"#{Lobbyist.api_key}\""
      end

      def self.http
        Lobbyist.http
      end

      def self.handle_response
        response = yield
        case response.status
        when 400
          raise(Lobbyist::Error::BadRequest, response.body)
        when 401
          raise(Lobbyist::Error::Unauthorized, response.body)
        when 403
          raise(Lobbyist::Error::Forbidden, response.body)
        when 404
          raise(Lobbyist::Error::NotFound, response.body)
        when 412
          raise(Lobbyist::Error::PreconditionFailed, response.body)
        when 422
          raise(Lobbyist::Error::UnprocessableEntity, response.body)
        when 500...505
          raise(Lobbyist::Error::InternalServerError,
                'There was an error processing that request. If the problem persists contact Customer Lobby Support.')
        else
          response = MultiJson.load(response.body)
          return response
        end
      rescue MultiJson::DecodeError
        raise(Lobbyist::Error::DecodeError, "Unparsable Response: #{response.body}")
      end
    end
  end
end
