require './catalog_classes/movie'
require './catalog_classes/item'
require './catalog_classes/source'
require './json/json_manipulation'

class App
  attr_reader :movies, :sources

  def initialize
    readjson = Manipulation.new
    @movies = readjson.read_data('movies.json') || []
    @sources = readjson.read_data('sources.json') || []
  end

  def add_movie
    print 'Enter source: '
    input = gets.chomp
    source = Source.new(input)
    source_obj = { id: source.id, name: source.name }
    @sources << source_obj unless @sources.include?(source_obj)

    print 'Author: '
    author = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish date in format d/mm/YYYY: '
    publish_date = gets.chomp
    print 'Is silent? [Y/N]: '
    silent = gets
    movie = Movie.new(author, source, label, publish_date, silent)
    movie_obj = { id: movie.id, author: movie.author, label: movie.label, publish_date: movie.publish_date }
    @movies << movie_obj unless @movies.include?(movie_obj)
    puts 'Movie successfully created'
  end

  def list_all_sources
    @sources.map { |source| p "ID: #{source[:id]} Name: #{source[:name]}" }
  end

  def list_all_movies
    @movies.map do |movie|
      p "ID: #{movie[:id]} Author: #{movie[:author]} Label: #{movie[:label]} Publish date: #{movie[:publish_date]}"
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
