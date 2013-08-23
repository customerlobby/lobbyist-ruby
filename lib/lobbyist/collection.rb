module Lobbyist
  class Collection
    
    attr_accessor :elements, :count, :page

    def initialize(elements, count = nil, page = nil)
      @elements = elements
      @count = count
      @page = page
    end

  end
end
