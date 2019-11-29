module Lobbyist
  module V2

    class CompanyMetrics < Lobbyist::V2::Base

      attr_accessor :id, :company_id, :sentiment_score, :published_reviews_count
      attr_accessor :positive_reviews_count, :negative_reviews_count, :distribution_by_medium
      attr_accessor :distribution_by_source, :distribution_by_rating, :appointments_count
      attr_accessor :customers_count, :customers_last_12_count, :average_reading_time
      attr_accessor :review_page_views, :site_page_views, :recent_reviews, :syndication_statuses
      attr_accessor :google_invitations_sent, :google_reviews_received

      def self.list(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/company_metrics.json", params))
      end
      
    end

  end
end
