require_relative './app'

class Main
  def initialize
    @app = App.new
  end

  def options
    puts '
Please choose an option by entering a number:
 1 - List all books
 2 - List all music albums
 3 - List all movies
 4 - List all games
 5 - List all genres
 6 - List all authors
 7 - List all sources
 8 - List all labels
 9 - Add a book
 10 - Add a music album
 11 - Add a movie
 12 - Add a game
 13 - Exit'
    print ' option: '
  end

  def start
    input = 0
    options
    while input.to_i < 13
      print ': '
      input = gets.chomp
      @app.handle_options(input)
    end
  end
end

main = Main.new
main.start
