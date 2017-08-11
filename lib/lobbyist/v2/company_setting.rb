module Lobbyist
  module V2

    class CompanySetting < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :no_review_reminder_status, :no_review_reminder_frequency
      attr_accessor :no_review_reminder_period, :no_review_reminder_last_sent_at, :no_contact_reminder_status
      attr_accessor :no_contact_reminder_frequency, :no_contact_reminder_last_sent_at, :reviews_per_page
      attr_accessor :reviews_page_enabled, :request_appointments_enabled, :send_appointment_emails_to
      attr_accessor :accept_contact_suggestions, :auto_publish_high_score_reviews
      attr_accessor :auto_publish_pending_low_score_notification, :auto_email_invitation
      attr_accessor :auto_queue_customer_calls, :syndicate_low_score_reviews, :syndicate_reviews
      attr_accessor :created_at, :updated_at, :wants_invoice_emails, :send_invoice_emails_to
      attr_accessor :smart_call_queuing, :invitation_delay_interval, :widget_color, :unhappy_customer_feedback
      attr_accessor :review_page_display_element

      def self.find(company_id, params = {})
        create_from_response(get("/v2/companies/#{company_id}/company_settings.json", params))
      end

      def self.update(company_id, params)
        create_from_response(put("/v2/companies/#{company_id}/company_settings.json", {company_setting: params}))
      end
    end

  end
end

