require_relative 'modules/game'
require_relative 'modules/author'
require_relative 'modules/genre'
require_relative 'modules/music_album'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'modules/movie'
require_relative 'modules/source'

class App
  include GameModule
  include AuthorModule
  include GenreModule
  include MusicAlbumsModule
  include BooksDataController
  include LabelsDataController
  include MovieModule
  include SourceModule

  def initialize
    @options = {
      '1' => method(:list_books),
      '2' => method(:list_all_music_albums),
      '3' => method(:list_all_movies),
      '4' => method(:list_games),
      '5' => method(:list_genres),
      '6' => method(:list_authors),
      '7' => method(:list_sources),
      '8' => method(:list_labels),
      '9' => method(:create_book),
      '10' => method(:create_music_album),
      '11' => method(:create_movie),
      '12' => method(:create_game),
      '13' => method(:quit_game)
    }
  end

  def handle_options(input)
    if input.to_i.between?(1, 13)
      @options[input].call
    else
      puts 'Invalid Input!'
    end
  end

  def quit_game
    puts 'Application exited successfully!'
    exit(true)
  end
end
