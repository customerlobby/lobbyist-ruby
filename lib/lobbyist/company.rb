module Lobbyist
  class Company < Lobbyist::Base

    attr_accessor :company_id, :enterprise_id, :account_level_id, :company_name, :company_description,
      :address1, :address2, :city, :state, :zip, :latitude, :longitude, :formatted_address, :phone,
      :website,:is_active, :abbreviated_name, :creation_date, :signup_admin_id, :signup_ip_addr,
      :account_terminated, :termination_date, :activation_code, :account_class, :promo_id, :average_changed,
      :average_score, :admin_notes, :customer_call_notes, :trial_source, :partner_id, :partner_account_id,
      :syndicate, :last_synd_stat_date, :last_credit_grant, :send_transaction_receipts, :send_transaction_receipts_to,
      :sales_status, :date_live, :country, :user_notes, :smart_invite, :enable_referral_marketing, :enable_retention_marketing,
      :rss_queue_push, :rss_queue_attempts, :rss_change_date, :rss_push_date, :feedburner_url, :last_handwritten_review_credit_grant,
      :api_user_name, :api_key_hash, :sugar_lead_id, :sugar_account_id, :sugar_opportunity_id, :company_info_changed,
      :created_at, :updated_at, :status

  end
end
