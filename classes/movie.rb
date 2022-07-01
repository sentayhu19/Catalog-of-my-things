require_relative '../item'

class Movie < Item
  attr_accessor :silent, :name

  def initialize(name, publish_date, silent)
    super(publish_date)
    @silent = silent
    @name = name
  end

  def can_be_archived?
    super || @silent
  end
end
