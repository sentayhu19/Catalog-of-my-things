require_relative './app'
require_relative './modules/menu'

class Main
  def initialize
    @app = App.new
  end

  def start
    input = 0
    menu_list
    while input.to_i < 13
      print ': '
      input = gets.chomp
      @app.handle_options(input)
    end
  end
end

main = Main.new
main.start
