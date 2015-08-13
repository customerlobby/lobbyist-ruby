module Lobbyist
  class Collection

    attr_accessor :elements, :count, :page, :total, :rpp, :match_copied

    def initialize(elements, count = nil, total = nil, rpp = nil, page = nil)
      @elements = elements
      @count = count
      @total = total
      @rpp = rpp
      @page = page
    end

    def sum(column, key = nil, value = nil)
      begin
        @elements.inject(0) do |sum, element|
          num = key && element.send(key) != value ? 0 : Float(element.send(column))
          sum + num
        end
      rescue
        nil
      end
    end
  end
end
