module Lobbyist
  class Review < Lobbyist::Base

    attr_accessor :review_id, :company_id, :review_page_id, :contact_id, :review_date, :review_summary,
      :review_body, :review_status, :total_score, :source, :is_featured, :ip_address, :admin_user_id,
      :open_invitation, :invite_id, :reviewer_location_state, :reviewer_location_city, :date_modified,
      :post_to_facebook, :created_at, :updated_at
    
    def company
      @company
    end
    
    def company=(attributes)
      @company = Company.new(attributes)
    end
    
    def contact
      @contact
    end
    
    def contact=(attributes)
      @contact = Contact.new(attributes)
    end
  end
end
  