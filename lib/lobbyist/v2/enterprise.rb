module Lobbyist
  module V2

    class Enterprise < Lobbyist::V2::Base
      attr_accessor :id, :name, :address1, :address2, :city, :state, :zipcode, :country
      attr_accessor :phone_number, :website, :status, :classification, :account_level_id
      attr_accessor :created_at, :updated_at, :description, :abbreviated_name, :average_score
      attr_accessor :location_count, :review_count, :latitude, :longitude
      
      def categories
        @categories
      end
      
      def categories=(attributes)
        @categories = []
        attributes.each do |attribute|
          @categories << Category.new(attribute)
        end
      end
      
      def self.list(params = {})
        create_collection_from_response(get("/v2/enterprises.json", params))
      end
      
      def self.show(id, params = {})
        create_from_response(get("/v2/enterprises/#{id}.json", params))
      end
      
      def self.create(enterprise_params, enterprise_user_params)
        create_from_response(post("/v2/enterprises.json", {enterprise: enterprise_params, enterprise_user: enterprise_user_params}))
      end
      
      def self.update(id, params)
        create_from_response(put("/v2/enterprises/#{id}.json", {enterprise: params}))
      end
      
      def self.destroy(id, params)
        create_from_response(delete("/v2/enterprises/#{id}.json", params))
      end
      
      def self.find(id)
        create_from_response(get("/v2/enterprises/#{id}.json"))
      end

      def self.locations(id, params = {})
        create_collection_from_response(get("/v2/enterprises/#{id}/companies", params))
      end
    end

  end
end
