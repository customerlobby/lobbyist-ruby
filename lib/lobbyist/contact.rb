module Lobbyist
  class Contact < Lobbyist::Base
    
    attr_accessor :id, :contact_id, :company_id, :first_name, :last_name,
      :phone_daytime, :phone_alt, :email, :address1, :address2,
      :city, :state, :zip, :country, :last_service_date, :notes,
      :email_disturb_status, :unsubscribe_reason, :unsubscribed_at,
      :exclude_referral_marketing, :exclude_retention_marketing,
      :facebook_like, :facebook_login_review, :twitter_follow,
      :date_added, :auto_review_id, :auto_invite_id, :auto_customer_call_id,
      :auto_review_draft_id, :facebook_uid, :facebook_access_token,
      :facebook_session_key

  end
end
