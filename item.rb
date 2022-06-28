class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date, archived)
    super(genre, author, source, label, publish_date, archived)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    published_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived
  end
end
