module Lobbyist
  class TerminationNotice < Lobbyist::Base
    
    attr_accessor :notice_id, :company_id, :notice_date, :dismissed
    
    def company
      @company
    end
    
    def company=(attributes)
      @company = Company.new(attributes)
    end
    
    def self.list(params = {})
      create_from_response(get('/v1/termination_notices.json', params))
    end
    
    def self.dismiss(params = {})
      create_from_response(put("/v1/termination_notices/dismiss.json", params))
    end
    
  end
end