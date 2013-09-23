module Lobbyist
  class Enterprise < Lobbyist::Base
    # attr_accessor

    def setting
      @setting_attributes
    end

    def setting=(attributes)
      @setting_attributes = EnterpriseSetting.new(attributes)
    end

    def category_ids
      @category_ids
    end

    def category_ids=(arrary_of_ids)
      @category_ids = arrary_of_ids
    end

    def self.create(enterprise_params, enterprise_user_params)
      params = {enterprise: enterprise_params, enterprise_user: enterprise_user_params}
      create_from_response(post("/v1/enterprises.json", params))
    end
  end
end
