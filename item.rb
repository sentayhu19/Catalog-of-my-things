require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :archived, :label, :genre, :author, :source

  def initialize(publish_date, archived: false)
    @id = SecureRandom.uuid
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def can_be_archived?
    period = Date.today.year - @publish_date.year
    period > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
