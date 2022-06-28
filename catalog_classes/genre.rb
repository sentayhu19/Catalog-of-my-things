require './item'

class Genre < Item
  attr_accessor :name, :items
  attr_reader :item

  def initialize(name)
    super(genre, author, source, label, publish_date)
    @name = name
    @item = []
  end

  def add_item(enre, author, source, label, publish_date)
    Item.new(genre, author, source, label, publish_date, self)
  end
end
