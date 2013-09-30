module Lobbyist
  class Collection
    
    attr_accessor :elements, :count, :page, :total, :rpp

    def initialize(elements, count = nil, total = nil, rpp = nil, page = nil)
      @elements = elements
      @count = count
      @total = total
      @rpp = rpp
      @page = page
    end

  end
end
