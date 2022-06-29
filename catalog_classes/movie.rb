require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(author, source, label, publish_date, silent: false)
    super('movie', author, source, label, publish_date)
    @silent = silent
  end

  def can_be_archived?
    @silent || super
  end
end
