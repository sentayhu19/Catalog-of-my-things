require './catalog_classes/item'
require './handler/book_handler'
require './handler/label_handler'
class App
  def initialize
    @book_manager = BookHandler.new
    @label_manager = LabelHandler.new(@items)
  end
  def select_option(option)
    handle_book = BookHandler.new
    case option
    when 2..8
      puts 'On construction'
      print "\e[2J\e[f"
      main
    when 1
        puts "Listing book"
        handle_book.list_all_books
        main
    when 9
      handle_book.add_book('','','')
      main
    when 13
      puts 'Goodbye see you again'
      exit(true)
    else
      puts 'Choose a correct option'
      main
    end
  end
end
