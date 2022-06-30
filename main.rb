require_relative 'app'

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

def menu_two(option, app)
  case option
  when 12 then app.add_game
  end
end

def main
  app = App.new
  option = ''
  loop do
    display_list
    option = gets.chomp.to_i
    if option.positive? && option < 7
      menu_one(option, app)
    elsif option >= 7 && option < 13
      menu_two(option, app)
    elsif option == 13
      puts ' '
      puts "\n\n\n********************\n*     Goodbye!     *\n********************\n"
      exit(true)
    else
      puts "Invalid option, please try again\n--------------------\n\n\n"
    end
  end
 
end

main
