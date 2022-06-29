require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    source.items << self unless source.items.include?(self)
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    published_year = Date.parse(publish_date).year
    current_year = Time.new.year
    current_year - published_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived
  end
end
