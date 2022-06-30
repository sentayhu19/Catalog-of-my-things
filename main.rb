# require './app'
require './actions/music_actions'
@music = MusicActions.new

def menu
  puts 'WELCOME TO CATALOG OF THINGS'
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all movies'
  puts '4 - List all games'
  puts '5 - List all genres'
  puts '6 - List all labels'
  puts '7 - List all authors'
  puts '8 - List all sources'
  puts '9 - Add a book'
  puts '10 - Add music album'
  puts '11 - Add a movie'
  puts '12 - Add a games'
  puts '13 - Exit'
end

def main
  menu
  option = gets.chomp.to_i
  select_option(option)
end

def select_option(option)
  case option
  when 1..9
    puts 'On construction'
    print "\e[2J\e[f"
    main
  when 10
    @music.add_a_music
    main
  when 13
    puts 'Goodbye see you again'
    exit(true)
  else
    puts 'Choose a correct option'
    main
  end
end

main
