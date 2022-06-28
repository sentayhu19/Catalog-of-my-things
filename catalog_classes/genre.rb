require './item'

class Genre < Item
  attr_accessor :name
  attr_reader :item

  def initialize(name)
    super(genre, author, source, label, publish_date)
    @name = name
    @item = []
  end

  def add_item(_genre, _author, _source, _label, _publish_date)
    @item = item
    item.genre.push(self) unless item.genre.include?(self)
  end

  def list_all_genre
    @genre.each_with_index do |x, index|
      puts "#{index}) [#{x.class.name}] Name: #{x.name}, ID: #{x.id}"
    end
  end
end
