module Lobbyist
  # Custom error class for rescuing from all Lobbyist errors
  class Error < StandardError

    attr_accessor :errors
    
    def initialize(messages)
      if messages.blank?
        message = self.class::MESSAGE || self.class.name
        super(message)
      else
        if messages.respond_to?("shift")
          super(messages.shift)
          if messages.empty?
            @errors = []
          else
            messages.each do |message|
              @errors = []
              @errors << message
            end
          end
        else
          super(messages)
        end
      end
    end

  end
end