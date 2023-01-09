# Libraries
require 'faraday'
require 'faraday_middleware'
require 'multi_json'
require 'active_support/all'
require 'hashie'

# Errors
require 'lobbyist/error/error'
require 'lobbyist/error/client_error'
require 'lobbyist/error/server_error'
require 'lobbyist/error/bad_gateway'
require 'lobbyist/error/bad_request'
require 'lobbyist/error/decode_error'
require 'lobbyist/error/forbidden'
require 'lobbyist/error/gateway_timeout'
require 'lobbyist/error/internal_server_error'
require 'lobbyist/error/not_acceptable'
require 'lobbyist/error/not_found'
require 'lobbyist/error/precondition_failed'
require 'lobbyist/error/service_unavailable'
require 'lobbyist/error/unauthorized'
require 'lobbyist/error/unprocessable_entity'
require 'lobbyist/error/protocol_unsupported'
require 'lobbyist/error/not_implemented'

# Library V1
require 'lobbyist/base'
require 'lobbyist/account_level'
require 'lobbyist/admin_performance_event'
require 'lobbyist/admin_user'
require 'lobbyist/appointment'
require 'lobbyist/basic_auth'
require 'lobbyist/category'
require 'lobbyist/challenge_communication'
require 'lobbyist/collection'
require 'lobbyist/company_setting'
require 'lobbyist/company_subscription'
require 'lobbyist/company_transaction'
require 'lobbyist/company_user'
require 'lobbyist/company'
require 'lobbyist/contact_draft'
require 'lobbyist/contact'
require 'lobbyist/data_upload'
require 'lobbyist/email_invitation'
require 'lobbyist/email_key'
require 'lobbyist/enterprise_setting'
require 'lobbyist/enterprise'
require 'lobbyist/free_trial'
require 'lobbyist/handwritten_review_credit'
require 'lobbyist/handwritten_review'
require 'lobbyist/live_trial'
require 'lobbyist/member_call'
require 'lobbyist/metrics'
require 'lobbyist/promo'
require 'lobbyist/review_challenge'
require 'lobbyist/review_comment'
require 'lobbyist/review_confirmation'
require 'lobbyist/review_flag'
require 'lobbyist/review_suggestion'
require 'lobbyist/review_topic'
require 'lobbyist/review_withdrawal_request'
require 'lobbyist/review'
require 'lobbyist/reviews_count'
require 'lobbyist/sales_team'
require 'lobbyist/scheduled_payment'
require 'lobbyist/smart_invite_setting'
require 'lobbyist/social_network_profile'
require 'lobbyist/suggestion_topic'
require 'lobbyist/termination_notice'
require 'lobbyist/topic'
require 'lobbyist/version'
require 'lobbyist/workflow_system'

# Library V2
require 'lobbyist/v2/base'
require 'lobbyist/v2/hashie_base'
require 'lobbyist/v2/account_level'
require 'lobbyist/v2/account_manager_metrics'
require 'lobbyist/v2/account_manager'
require 'lobbyist/v2/activity_summary'
require 'lobbyist/v2/add_on'
require 'lobbyist/v2/admin_user'
require 'lobbyist/v2/algorithm_test_run_contact'
require 'lobbyist/v2/algorithm_test_run'
require 'lobbyist/v2/am_assignable_company'
require 'lobbyist/v2/am_unassignable_company'
require 'lobbyist/v2/appointment'
require 'lobbyist/v2/authorization'
require 'lobbyist/v2/call_agent_metrics'
require 'lobbyist/v2/campaign_analysis'
require 'lobbyist/v2/campaign_clone_history'
require 'lobbyist/v2/campaign_checklist'
require 'lobbyist/v2/campaigns_credit_summary'
require 'lobbyist/v2/campaign_iteration'
require 'lobbyist/v2/campaign_pricing'
require 'lobbyist/v2/texting'
require 'lobbyist/v2/category_default_offer_template'
require 'lobbyist/v2/category'
require 'lobbyist/v2/tag'
require 'lobbyist/v2/category_default_front_template'
require 'lobbyist/v2/webhook_subscription'
require 'lobbyist/v2/category_insight_metrics'
require 'lobbyist/v2/communication_campaign'
require 'lobbyist/v2/communication_campaign_result'
require 'lobbyist/v2/communication_piece'
require 'lobbyist/v2/company_customer_call'
require 'lobbyist/v2/company_mail_credit_audit'
require 'lobbyist/v2/company_metrics'
require 'lobbyist/v2/company_place'
require 'lobbyist/v2/company_setting'
require 'lobbyist/v2/company_subscription'
require 'lobbyist/v2/company_termination'
require 'lobbyist/v2/company_transaction'
require 'lobbyist/v2/skipped_payment'
require 'lobbyist/v2/company_user'
require 'lobbyist/v2/company'
require 'lobbyist/v2/company_communication_campaign_result'
require 'lobbyist/v2/configuration'
require 'lobbyist/v2/contact'
require 'lobbyist/v2/csv_upload'
require 'lobbyist/v2/custom_email_template'
require 'lobbyist/v2/custom_filter'
require 'lobbyist/v2/custom_filter_upload'
require 'lobbyist/v2/custom_invitation'
require 'lobbyist/v2/customer_activity'
require 'lobbyist/v2/customer_call_credit_metrics'
require 'lobbyist/v2/customer_call_credit'
require 'lobbyist/v2/customer_call_metrics'
require 'lobbyist/v2/customer_call'
require 'lobbyist/v2/customer_metrics'
require 'lobbyist/v2/customer_filter_metric'
require 'lobbyist/v2/customer_suggestion'
require 'lobbyist/v2/customer_service_contract'
require 'lobbyist/v2/customer_tag'
require 'lobbyist/v2/customers_segmentation'
require 'lobbyist/v2/customer_transaction'
require 'lobbyist/v2/customer_vehicle_mileage'
require 'lobbyist/v2/customer_vehicle'
require 'lobbyist/v2/customer'
require 'lobbyist/v2/credit_grant'
require 'lobbyist/v2/data_upload'
require 'lobbyist/v2/default_review_destination'
require 'lobbyist/v2/default_text_message_template'
require 'lobbyist/v2/direct_connect_contact'
require 'lobbyist/v2/direct_connect_event'
require 'lobbyist/v2/direct_connect_mileage'
require 'lobbyist/v2/direct_connect_service_contract'
require 'lobbyist/v2/direct_connect_transaction'
require 'lobbyist/v2/direct_connect_vehicle'
require 'lobbyist/v2/direct_connect'
require 'lobbyist/v2/direct_connect_import_count'
require 'lobbyist/v2/direct_connect_setting'
require 'lobbyist/v2/direct_connect_setup_step'
require 'lobbyist/v2/filter'
require 'lobbyist/v2/cl_email_campaign_template'
require 'lobbyist/v2/email_invitation_metrics'
require 'lobbyist/v2/email_invitation'
require 'lobbyist/v2/enterprise_email_setting'
require 'lobbyist/v2/enterprise_metrics'
require 'lobbyist/v2/enterprise_setting'
require 'lobbyist/v2/enterprise_user'
require 'lobbyist/v2/enterprise'
require 'lobbyist/v2/front_template'
require 'lobbyist/v2/campaigns_front_templates'
require 'lobbyist/v2/generic_status'
require 'lobbyist/v2/global_campaign_setting'
require 'lobbyist/v2/handwritten_review_metrics'
require 'lobbyist/v2/handwritten_review'
require 'lobbyist/v2/image'
require 'lobbyist/v2/iteration_results'
require 'lobbyist/v2/inheritable_campaign_company'
require 'lobbyist/v2/marketing_message_template'
require 'lobbyist/v2/master_customer_call'
require 'lobbyist/v2/member_aggregate_insight'
require 'lobbyist/v2/member_insight_metrics'
require 'lobbyist/v2/member_insights'
require 'lobbyist/v2/monthly_recurring_revenue'
require 'lobbyist/v2/offer_template'
require 'lobbyist/v2/partner_account'
require 'lobbyist/v2/partner_integration_company_user'
require 'lobbyist/v2/partner_metrics'
require 'lobbyist/v2/partner_user'
require 'lobbyist/v2/past_year_data'
require 'lobbyist/v2/postcard_preview'
require 'lobbyist/v2/pulse_m_promo'
require 'lobbyist/v2/pulse_m_account_level'
require 'lobbyist/v2/pulse_m_subscription'
require 'lobbyist/v2/print_batch_job'
require 'lobbyist/v2/private_feedback_topic'
require 'lobbyist/v2/promo'
require 'lobbyist/v2/recommended_budget'
require 'lobbyist/v2/reports/company'
require 'lobbyist/v2/review_challenge'
require 'lobbyist/v2/review_comment'
require 'lobbyist/v2/review_confirmation_metrics'
require 'lobbyist/v2/review_confirmation'
require 'lobbyist/v2/review_destination'
require 'lobbyist/v2/review_draft'
require 'lobbyist/v2/review_invitation'
require 'lobbyist/v2/review_metrics'
require 'lobbyist/v2/review_topic'
require 'lobbyist/v2/review_flag'
require 'lobbyist/v2/review_withdrawal_request'
require 'lobbyist/v2/review'
require 'lobbyist/v2/reviews_count'
require 'lobbyist/v2/receipt_generator'
require 'lobbyist/v2/sample_contact'
require 'lobbyist/v2/scotty_setting'
require 'lobbyist/v2/smart_invite_setting'
require 'lobbyist/v2/social_network_page'
require 'lobbyist/v2/social_network_profile'
require 'lobbyist/v2/split_mapping'
require 'lobbyist/v2/summary'
require 'lobbyist/v2/supported_campaigns'
require 'lobbyist/v2/urls'
require 'lobbyist/v2/url_conversion'
require 'lobbyist/v2/workflow_system'
require 'lobbyist/v2/workflow_system_template'
require 'lobbyist/v2/zipcode'
require 'lobbyist/v2/zipped_image_upload'
require 'lobbyist/v2/company_feature_flag'


#Library V2/admin/
require 'lobbyist/v2/admin/campaign_iteration'
require 'lobbyist/v2/admin/communication_piece'

# Library v2/paysimple/gateway
require 'lobbyist/v2/paysimple/gateway/token'
require 'lobbyist/v2/paysimple/gateway/customer_token'


module Lobbyist

  @@api_base = 'http://localhost:3000'
  @@api_key = nil
  @@api_secret = nil

  def self.api_base
    @@api_base
  end

  def self.api_base=(base)
    @@api_base = base
  end

  def self.api_key
    @@api_key ||= ENV['LOBBYIST_API_KEY']
  end

  def self.api_key=(key)
    @@api_key = key
  end

  def self.api_secret
    @@api_secret ||= ENV['LOBBYIST_API_SECRET']
  end

  def self.api_secret=(secret)
    @@api_secret = secret
  end

  def self.http
    @@connection ||= Faraday.new(:url => @@api_base) do |faraday|
      p faraday
      p '*' * 50
      p Thread.current[:request_id]
      faraday.request  :multipart
      faraday.request  :url_encoded             # for GET params
      faraday.request  :json                    # for PUT/POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
