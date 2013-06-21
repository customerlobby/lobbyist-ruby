module Lobbyist
  class Setting < Lobbyist::Base

    attr_accessor :id, :company_id, :no_review_reminder_status, :no_review_reminder_frequency, :no_review_reminder_period, 
    :no_review_reminder_last_sent_at, :no_contact_reminder_status, :no_contact_reminder_frequency, :no_contact_reminder_last_sent_at,
    :reviews_per_page, :reviews_page_enabled, :request_appointments_enabled, :send_appointment_emails_to, :accept_contact_suggestions,
    :auto_publish_high_score_reviews, :auto_publish_pending_low_score_notification, :syndicate_low_score_reviews, :syndicate_reviews,
    :created_at, :updated_at

  end
end