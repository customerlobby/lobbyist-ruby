# frozen_string_literal: true

module Lobbyist
  module V2
    # Wrapper for PostcardPreview data
    class PostcardPreview < Lobbyist::V2::Base
      attr_accessor :id, :company_id, :campaign_id, :front_template_id, :pdf_filename, :user_name, :company_name
      attr_accessor :company_phone, :front_image_filename, :message_position, :front_template_content, :custom_image
      attr_accessor :background_color, :text_color, :marketing_message_template_content, :services_offered
      attr_accessor :call_to_action_tracking, :offer_content, :disclaimers, :review_type, :logo_file_name, :tagline
      attr_accessor :regulatory_info, :company_website, :form_factor, :custom_back_image, :created_at, :updated_at
    end
  end
end
