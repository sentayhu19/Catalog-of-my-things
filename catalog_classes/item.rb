require 'date'

class Item

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
    @author = author
    @source = source
    source.items << self unless source.items.include?(self)
    @label = label

  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived
  end
end

def from_string(date)
  Date.parse(date)
end
