require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(author, label, publish_date, silent)
    super('movie', author, label, publish_date)
    @silent = false unless silent == 'N'
  end

  def can_be_archived?
    @silent || super
  end
end
