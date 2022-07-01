require './app'

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
  app = App.new
  app.select_option(option)
end



main
