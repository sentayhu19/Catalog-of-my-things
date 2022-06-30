class Label
  attr_reader :items, :id
  attr_accessor :title, :color

  def initialize(title, color)
    @title = title
    @color = color
    @id = rand(1...500)
    @items []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end

  def to_json(*_data)
    {
      id: @id,
      color: @color,
      title: @title,
      items: @items.map(&:id)
    }.to_json
  end
end
