class Source
  attr_accessor :id, :name
  attr_reader :items

  def initialize(name, id = '')
    @id = if id.instance_of?(Integer)
            id
          else
            Random.rand(1..1000)
          end
    @name = name
    @items = []
  end

  def add_item(item)
    @items << (item)
    item.source = self
  end
end
