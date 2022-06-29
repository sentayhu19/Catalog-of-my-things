class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.new.rand(1..1000)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    published_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived
  end
end
