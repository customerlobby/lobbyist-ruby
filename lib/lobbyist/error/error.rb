module Lobbyist
  # Custom error class for rescuing from all Lobbyist errors
  class Error < StandardError

    attr_accessor :errors
    
    def initialize(messages)
      if messages.blank?
        super(self.class.name)
      else
        if messages.respond_to?("shift")
          super(messages.shift)
          messages.each do |message|
            @errors << message
          end
        else
          super(messages)
        end
      end
    end

  end
end