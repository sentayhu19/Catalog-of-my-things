require './catalog_classes/movie'
require './catalog_classes/item'
require './catalog_classes/source'

class App
  def initialize
    @movies = []
    @sources = []
  end

  def add_movie
    print 'Enter source: '
    input = gets.chomp
    source = Source.new(input)
    @sources << source unless @sources.include?(source)

    print 'Author: '
    author = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish date in format d/mm/YYYY: '
    publish_date = gets.chomp
    print 'Is silent? [Y/N]: '
    silent = gets
    movie = Movie.new(author, source, label, publish_date, silent)
    @movies << movie unless @movies.include?(movie)
    puts 'Movie successfully created'
  end

  def list_all_sources
    @sources.map { |source| p "ID: #{source.id} Name: #{source.name}" }
  end

  def list_all_movies
    @movies.map do |movie|
      p "ID: #{movie.id} Author: #{movie.author} Label: #{movie.label} Publish date: #{movie.publish_date}"
    end
  end

  def redirection(option)
    case option
    when 3
      list_all_movies
    when 8
      list_all_sources
    when 9
      add_movie
    else
      p 'Invalid input'
    end
  end
end
