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

    def sum(column, conditions = {})
      selected = conditions.blank? ? @elements :
        @elements.select { |element| valid_element? element, conditions }

      selected.inject(0) do |sum, element|
        num = element.send(column).to_i
        sum + Float(num)
      end
    end

    private

    def valid_element?(element, conditions)
      conditions.each do |key, value|
        return false if element.send(key) != value
      end
    end
  end
end
