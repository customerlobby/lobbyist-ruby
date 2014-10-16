module Lobbyist
  module V2

    class PartnerMetrics < Lobbyist::V2::Base

      attr_accessor :id, :partner_id, :sentiment_score, :published_reviews_count
      attr_accessor :positive_reviews_count, :negative_reviews_count, :distribution_by_medium
      attr_accessor :distribution_by_source, :distribution_by_rating, :appointments_count
      attr_accessor :customers_count, :customers_last_12_count, :average_reading_time
      attr_accessor :active_locations_count, :inactive_locations_count
      attr_accessor :distribution_by_syndication_type, :syndicated_reviews_count, :review_page_views
      attr_accessor :cumulative_locations_by_month, :locations_with_review_counts, :reviews_by_month
      attr_accessor :cumulative_reviews_by_month, :recent_review_list

      def self.list(partner_id, params = {})
        create_from_response(get("/v2/partners/#{partner_id}/partner_metrics.json", params))
      end

    end

  end
end