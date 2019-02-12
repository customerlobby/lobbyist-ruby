# Image re-factor (CA--8869)
# module Lobbyist
#   module V2
#     class CampaignsFrontTemplates < Lobbyist::V2::HashieBase
#       attr_accessor :id, :communication_campaign_id, :company_id, :image_filename
#       attr_accessor :message_position, :content, :custom_image, :created_at, :updated_at
#       attr_accessor :image_resize_status, :category_default_front_template_id, :status
#       attr_accessor :offset

#       def self.list(params = {})
#         response = get("/v2/campaigns-front-templates.json", params)
#         create_response(response)
#       end
#     end
#   end
# end
