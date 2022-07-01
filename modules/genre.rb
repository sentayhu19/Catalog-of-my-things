require 'json'
require_relative 'menu.rb'

module GenreModule
  def add_genre(genre)
    genre_db = './json/genres.json'
    genres = []
    new_genre = {
      'name' => genre.name
    }

    genres = JSON.parse(File.read(genres_db)) if File.exist?(genres_db)

    genres << new_genre
    File.write(genre_db, JSON.pretty_generate(genres))
  end

  def fetch_genres
    genre_db = './json/genres.json'
    genres = []

    if File.exist?(genre_db)
      if File.empty?(genre_db)
        genres
      else
        JSON.parse(File.read(genre_db))
      end
    else
      genres
    end
  end

  def list_genres
    genres = fetch_genres
    if genres.empty?
      puts 'No Genres available'
    else
      print 'The genres are : '
      genres.each do |genre|
        puts genre.name
      end
      menu_list
    end
  end
end
