
require_relative '../module/date'
class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date:, archived: false)
    # @genre = genre
    # @author = author
    # @source = source
    # @label = label
    @publish_date = DateData.from_string(publish_date)
    @archived = archived
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived
  end
end


