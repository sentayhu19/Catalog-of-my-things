require './catalog_classes/movie'
require './catalog_classes/item'
require './catalog_classes/source'
require './json/json_manipulation'

class MovieActions
  attr_reader :movies, :sources

  def initialize
    readjson = Manipulation.new
    @movies = readjson.read_data('movies.json') || []
    @sources = readjson.read_data('sources.json') || []
  end

  def add_source
    unless @sources.empty?
      print 'Do you want select from existing list? [Y/N]: '
      option = gets.chomp
    else
      puts 'is realy empty'
      option = 'N'
    end
 
    case option
    when 'Y', 'y', 'yes', 'YES'
      list_all_sources
      print 'Select by ID: '
      option_id = gets.to_i
      opt_id = @sources.select { |i| i[:id] == option_id }.first
      if opt_id 
        @source = Source.new(opt_id[:name], opt_id[:id])
      else 
        p 'Invalid ID'
        add_source
      end
    when 'N', 'n', 'no', 'NO'
      print 'Enter source: '
      input = gets.chomp
      @source = Source.new(input)
      source_obj = { id: @source.id, name: @source.name }
      @sources << source_obj unless @sources.include?(source_obj)
    else
      p 'Invalid input'
      add_source
    end
  end
  
  def add_movie
    add_source

    print 'Author: '
    author = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish date in format d/mm/YYYY: '
    publish_date = gets.chomp
    print 'Is it silent? [Y/N]: '
    silent = gets
    movie = Movie.new(author, label, publish_date, silent)
    @source.add_item(movie)
    movie_obj = { id: movie.id, author: movie.author, source: movie.source.name, label: movie.label, publish_date: movie.publish_date }
    @movies << movie_obj unless @movies.include?(movie_obj)
    puts 'Movie successfully created'
  end

  def list_all_sources
    @sources.map { |source| puts "ID: #{source[:id]} Name: #{source[:name]}" }
  end

  def list_all_movies
    @movies.map do |movie|
      puts "ID: #{movie[:id]} Author: #{movie[:author]} Source: #{movie[:source]} Label: #{movie[:label]} Publish date: #{movie[:publish_date]}"
    end
  end
end