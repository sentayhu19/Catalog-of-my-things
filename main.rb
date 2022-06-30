require './app'
require './json/json_manipulation'

@my_app = App.new
@savejson = Manipulation.new

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

def middle
  puts 'Select (0) to goback to the menu or (13) to exit'
  mid = gets.chomp.to_i
  case mid
  when 0
    main
  when 13
    select_option(13)
  else
    p 'Invalid input'
    main
  end
end

def select_option(option)
  case option

  when (3 || 8)..9
    @my_app.redirection(option)
    middle
  when 10..12
    puts 'On construction'
    print "\e[2J\e[f"
    main
  when 13
    puts 'Goodbye see you again'
    @savejson.save_data(@my_app.movies, 'movies.json')
    @savejson.save_data(@my_app.sources, 'sources.json')
    exit(true)
  else
    puts 'Choose a correct option'
    main
  end
end

main
