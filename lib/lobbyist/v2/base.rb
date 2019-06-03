module Lobbyist
  module V2

    class Base
      RETRY_INTERVAL = 2

      def initialize(attributes)
        process_attributes(attributes)
      end

      def add_references(attributes)
        process_attributes(attributes)
      end

      protected

      def self.create_from_response(response)
        if response.is_a?(Array)
          list = []
          response.each do |element|
            list << build_entity(element)
          end
          return list
        else
          return build_entity(response)
        end
      end

      def self.create_collection_from_response(response)
        return Collection.new(create_from_response(response['items']), response['count'], response['total'], response['rpp'], response['page'])
      end

      def self.create_collection_from_response_with_model_name(response)
        if response.has_key?("#{entity_name.to_s}s")
          list = []
          response["#{entity_name.to_s}s"].each do |element|
            list << self.new(element)
          end
          return list
        end
      end

      def self.build_entity(data)
        if data.has_key?(entity_name.to_s)
          entity = self.new(data.delete(entity_name))
        else
          entity = Object.const_get("Lobbyist").const_get("V2").const_get(data.keys.first.classify).new(data.delete(data.keys.first))
        end
        entity.add_references(data)
        return entity
      end

      private

      def self.entity_name
        return self.name.demodulize.underscore
      end

      def self.request_id
        Thread.current[:request_id] rescue nil
      end

      def self.get(path, params = {})
        handle_response do
          http.get do |request|
            request.url path, params
            request.headers['Accept'] = 'application/json'
            request.headers['Authorization'] = auth_header
            set_datadog_trace(request)
            if request_id.present?
              request.headers['X-Request-Id']  = request_id
            end
          end
        end
      end

      def self.post(path, params = {}, multipart = false)
        handle_response do
          http.post do |request|
            request.url path
            request.body = params
            set_datadog_trace(request)
            if !multipart
              request.headers['Accept'] = 'application/json'
              request.headers['Content-Type'] = 'application/json'
            end
            if request_id.present?
              request.headers['X-Request-Id']  = request_id
            end
            request.headers['Authorization'] = auth_header
          end
        end
      end

      def self.put(path, params = {}, multipart = false)
        handle_response do
          http.put do |request|
            request.url path
            request.body = params
            set_datadog_trace(request)
            if !multipart
              request.headers['Accept'] = 'application/json'
              request.headers['Content-Type'] = 'application/json'
            end
            if request_id.present?
              request.headers['X-Request-Id']  = request_id
            end
            request.headers['Authorization'] = auth_header
          end
        end
      end

      def self.delete(path, params = {})
        handle_response do
          http.delete do |request|
            request.url path, params
            set_datadog_trace(request)
            if request_id.present?
              request.headers['X-Request-Id']  = request_id
            end
            request.headers['Accept'] = 'application/json'
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
        begin
          response = yield
        rescue Faraday::ConnectionFailed
          sleep RETRY_INTERVAL
          retry
        end
        case response.status
        when 400
          raise Lobbyist::Error::BadRequest.new(response.body)
        when 401
          raise Lobbyist::Error::Unauthorized.new(response.body)
        when 403
          raise Lobbyist::Error::Forbidden.new(response.body)
        when 404
          raise Lobbyist::Error::NotFound.new(response.body)
        when 412
          raise Lobbyist::Error::PreconditionFailed.new(response.body)
        when 422
          raise Lobbyist::Error::UnprocessableEntity.new(response.body)
        when 500...505
          raise Lobbyist::Error::InternalServerError.new("There was an error processing that request. If the problem persists contact Customer Lobby Support.")
        else
          response = MultiJson.load(response.body)
          return response
        end
      # rescue MultiJson::DecodeError
      #   raise Lobbyist::Error::DecodeError.new "Unparsable Response: #{response.body}"
      end

      def self.set_datadog_trace(request)
        Datadog.tracer.trace('web.call') do |span|
          env = {}
          Datadog::HTTPPropagator.inject!(span.context, env)
          request.headers.merge!(env)
        end
      end

      def process_attributes(attributes)
        return if attributes.blank?
        attributes.each do |k,v|
          define_attribute(k, v.is_a?(Hash)) unless self.respond_to?("#{k}=")
          self.send "#{k}=", v
        end
      end

      # Create the getter and setter for the attribute named 'name'. If reference is true
      # create the alternate version of the setter.
      def define_attribute(name, reference = false)
        self.class_eval("def #{name};@#{name};end")
        if reference
          self.class_eval("def #{name}=(val);@#{name}=Lobbyist::V2::#{name.camelize}.new(val);end")
        else
          self.class_eval("def #{name}=(val);@#{name}=val;end")
        end
      end
    end
  end
end
