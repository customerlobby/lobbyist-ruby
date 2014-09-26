module Lobbyist
  module V2
    class DirectConnect < Lobbyist::V2::Base
      attr_accessor :workflow_systems_count,:companies_with_problems, :uploads_today, :connected_not_processing

      def self.stats(params={})
        result = get('/v2/direct_connect/stats.json', params)
      end

      def self.companies_with_no_recent_uploads(params={})
        result = get('/v2/direct_connect/no_files_uploaded_in_last_week.json', params)
      end
    end
  end
end
