module Lobbyist
  module V2

    class Category < Lobbyist::V2::Base
      attr_accessor :id, :name, :default_services, :repeat_marketing_campaign_enabled,
                    :salesforce_name, :threshold, :min_days_between_mailings, :roi,
                    :accelerator, :mail_delay_offset, :transaction_grouping_interval,
                    :generate_marketing_insights, :created_at, :updated_at,
                    :companies_count

      def self.list(params = {})
        create_collection_from_response(get('/v2/categories.json', params))
      end

      def self.find(id, params = {})
        create_from_response(get("/v2/categories/#{id}.json", params))
      end

      def self.create(params = {})
        create_from_response(post("v2/categories", params))
      end

      def self.update(id, params = {})
        create_from_response(put("/v2/categories/#{id}.json", params))
      end
    end

  end
end
