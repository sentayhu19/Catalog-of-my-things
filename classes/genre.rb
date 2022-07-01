require 'securerandom'

class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
