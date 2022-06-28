require './catalog_classes/item'

class Movie < Item
  attr_accessor :silet
  def initialize(author, source, labal, publish_date, silet)
    super('movie', author, source, labal, publish_date)
    @silet = silet
  end

  def can_be_archived?
    @silet || super
  end
end