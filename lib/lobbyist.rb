# Libraries
require 'faraday'
require 'faraday_middleware'
require 'multi_json'
require 'active_support/all'

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
require 'lobbyist/customer_call'
require 'lobbyist/draft'
require 'lobbyist/email_invitation'
require 'lobbyist/email_key'
require 'lobbyist/enterprise_setting'
require 'lobbyist/enterprise'
require 'lobbyist/free_trial'
require 'lobbyist/handwritten_review_credit'
require 'lobbyist/handwritten_review'
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
require 'lobbyist/v2/account_level'
require 'lobbyist/v2/appointment'
require 'lobbyist/v2/authorization'
require 'lobbyist/v2/category'
require 'lobbyist/v2/company_metrics'
require 'lobbyist/v2/company_place'
require 'lobbyist/v2/company_setting'
require 'lobbyist/v2/company_subscription'
require 'lobbyist/v2/company_transaction'
require 'lobbyist/v2/company_user'
require 'lobbyist/v2/company'
require 'lobbyist/v2/contact'
require 'lobbyist/v2/csv_upload'
require 'lobbyist/v2/custom_invitation'
require 'lobbyist/v2/customer_activity'
require 'lobbyist/v2/customer_call_credit_metrics'
require 'lobbyist/v2/customer_call_credit'
require 'lobbyist/v2/customer_call_metrics'
require 'lobbyist/v2/customer_call'
require 'lobbyist/v2/customer_metrics'
require 'lobbyist/v2/customer_suggestion'
require 'lobbyist/v2/customer'
require 'lobbyist/v2/data_upload'
require 'lobbyist/v2/email_invitation_metrics'
require 'lobbyist/v2/email_invitation'
require 'lobbyist/v2/enterprise_metrics'
require 'lobbyist/v2/enterprise_setting'
require 'lobbyist/v2/enterprise_user'
require 'lobbyist/v2/enterprise'
require 'lobbyist/v2/handwritten_review_metrics'
require 'lobbyist/v2/handwritten_review'
require 'lobbyist/v2/partner_account'
require 'lobbyist/v2/partner_user'
require 'lobbyist/v2/private_feedback_topic'
require 'lobbyist/v2/promo'
require 'lobbyist/v2/review_challenge'
require 'lobbyist/v2/review_comment'
require 'lobbyist/v2/review_confirmation_metrics'
require 'lobbyist/v2/review_confirmation'
require 'lobbyist/v2/review_metrics'
require 'lobbyist/v2/review_topic'
require 'lobbyist/v2/review_withdrawal_request'
require 'lobbyist/v2/review'
require 'lobbyist/v2/scotty_setting'
require 'lobbyist/v2/smart_invite_setting'
require 'lobbyist/v2/social_network_page'
require 'lobbyist/v2/social_network_profile'
require 'lobbyist/v2/summary'
require 'lobbyist/v2/urls'
require 'lobbyist/v2/workflow_system'

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
      faraday.request  :url_encoded             # for GET params
      faraday.request  :json                    # for PUT/POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
