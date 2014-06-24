module Lobbyist
  module V2

    class ReviewMetrics < Lobbyist::V2::Base

      attr_accessor :id, :company_id, :sentiment_score, :review_page_views, :site_page_views
      attr_accessor :distribution_by_medium, :average_reading_time, :popular_reviews, :recent_reviews

      def self.list(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/review_metrics.json", params))
      end
      
      def self.manage_metrics(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/review_metrics/manage-metrics.json", params))
      end
    end

  end
end
