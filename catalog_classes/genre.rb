require './item'

class Genre < Item
  attr_accessor :name, :items

  def initialize(name)
    super(genre, author, source, label, publish_date)
    @name = name
    @items = []
  end

  def add_item; end
end
