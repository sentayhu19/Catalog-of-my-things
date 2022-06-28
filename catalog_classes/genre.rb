require './item'

class Genre > Item
    attr_accessor :name, :items
    def initialize(name)
        @name = name
        @items = []
    end

    def add_item
    end
end
