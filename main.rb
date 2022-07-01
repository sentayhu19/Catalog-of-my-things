
require './app'
require './json/json_manipulation'

@my_app = App.new
@savejson = Manipulation.new


def display_list
  puts "****************************\n*       MY CATALOGUE       *\n****************************\n\n\n"
  puts "Select an option:\n--------------------\n"
  puts "


    4. List of games
    12. Add a game
    13. Exit"
end

def menu_one(option, app)
  case option
  when 4 then app.list_all_games
  end
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
