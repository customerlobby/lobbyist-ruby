module Lobbyist
  module V2

    class Tag < Lobbyist::V2::Base
      attr_accessor :id, :name, :display_name

      def self.list(params = {})
        create_collection_from_response(get('/v2/tags.json', params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/tags/#{id}.json", params))
      end

      def self.create(params = {})
        create_from_response(post("v2/tags", params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/tags/#{id}.json", params))
      end
    end

  end
end
