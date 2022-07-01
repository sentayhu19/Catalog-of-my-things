require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date, :archived
  attr_reader :id, :source

  def initialize(genre, author, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author  
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
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
