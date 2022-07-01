require 'json'
require_relative '../classes/movie'

module MovieModule
  def add_movie(movie)
    movie_storage = './json/movies.json'
    movies = []
    new_movie = {
      'name' => movie.name, 'publish_date' => movie.publish_date, 'silent' => movie.silent
    }

    movies = JSON.parse(File.read(movie_storage)) if File.exist?(movie_storage)
    movies << new_movie
    File.write(movie_storage, JSON.pretty_generate(movies))
  end

  def load_movies
    movie_storage = './json/movies.json'
    movies = []

    if File.exist?(movie_storage)
      if File.empty?(movie_storage)
        movies
      else
        JSON.parse(File.read(movie_storage))
      end
    else
      movies
    end
  end

  def create_movie
    print 'Enter the movie name: '
    name = gets.chomp

    print 'Enter the Date published with Date format[yyyy-mm-dd]: '
    date_published = gets.chomp

    print 'Please indicate if this is a Silent Movie(y/n): '
    silent = gets.chomp.downcase == 'y'

    new_movie = Movie.new(name, date_published, silent)
    add_movie(new_movie)
    puts 'Movie created successfully'.colorize(color: :light_green)
  rescue StandardError
    puts 'Cannot create movie, check your Input format'.colorize(color: :light_red)
  end

  def list_all_movies
    movies = load_movies

    if movies.empty?
      puts 'Woops! There are currently no movies in the list.'
    else
      puts "#{movies.count} Movies Found!"
      movies.each do |movie|
        puts "Title: '#{movie['name']}, Published Date: #{movie['publish_date']}, Silent: #{movie['silent']}"
      end
    end
  end
end
