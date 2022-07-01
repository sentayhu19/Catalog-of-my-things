class Source
  attr_accessor :id, :name
  attr_reader :items

  def initialize(name, id = '')
    unless id.class == Integer
      @id = Random.rand(1..1000)
    else
      @id = id
    end
    @name = name
    @items = []
  end

  def add_item(item)
    @items << (item)
    item.source = self
  end
end
