require './item'

class Genre < Item
  attr_accessor :name
  attr_reader :item

  def initialize(name)
    super(genre, author, source, label, publish_date)
    @name = name
    @item = []
  end

  def add_item(genre, author, source, label, publish_date)
    @item = item
    item.genre.push(self) unless item.genre.include?(self)
  end
end
