module Lobbyist
  class CompanySetting < Lobbyist::Base

    attr_accessor :id, :company_id, :no_review_reminder_status, :no_review_reminder_frequency, :no_review_reminder_period, 
    :no_review_reminder_last_sent_at, :no_contact_reminder_status, :no_contact_reminder_frequency, :no_contact_reminder_last_sent_at,
    :reviews_per_page, :reviews_page_enabled, :request_appointments_enabled, :send_appointment_emails_to, :accept_contact_suggestions,
    :auto_publish_high_score_reviews, :auto_publish_pending_low_score_notification, :auto_email_invitation, :auto_queue_customer_calls, 
    :syndicate_low_score_reviews, :syndicate_reviews, :wants_invoice_emails, :send_invoice_emails_to, :unhappy_customer_feedback, 
    :created_at, :updated_at

    def self.update(id, params = {})
      create_from_response(put("/v1/company_settings/#{id}.json", params))
    end
  end
end