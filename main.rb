require_relative './app'
require_relative './modules/menu.rb'

class Main
  def initialize
    @app = App.new
  end

  def options
  menu_list
    puts ' Please select an option from the list above: '
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
