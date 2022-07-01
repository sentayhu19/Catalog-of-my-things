require 'json'
require_relative '../classes/game'
require_relative 'menu.rb'

module GameModule
  def add_game(game)
    game_db = './json/games.json'
    games = []
    new_game = {
      'multiplayer' => game.multiplayer,
      'last_played_at' => game.last_played_at,
      'publish_date' => game.publish_date
    }

    games = JSON.parse(File.read(game_db)) if File.exist?(game_db)

    games << new_game
    File.write(game_db, JSON.pretty_generate(games))
  end

  def fetch_games
    game_db = './json/games.json'
    games = []

    if File.exist?(game_db)
      if File.empty?(game_db)
        games
      else
        JSON.parse(File.read(game_db))
      end
    else
      games
    end
  end

  def list_games
    games = fetch_games
    if games.empty?
      puts 'No game available'
      menu_list
    else
      puts "#{games.count} Games Found!"
      games.each do |game|
        puts "Players: #{game['multiplayer']} \n" 
             "Last Played: #{game['last_played_at']} \nPublished: #{game['publish_date']} \n\n"
      end
      menu_list
    end
  end

  def create_game
    print 'Enter number of players: '
    multiplayer = gets.chomp

    print 'Enter Last Played Date format[yyyy-mm-dd]: '
    last_played_at = gets.chomp

    print 'Enter Date Published format[yyyy-mm-dd]: '
    publish_date = gets.chomp

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    add_game(new_game)
    puts 'Game created successfully'
    menu_list
  rescue StandardError
    puts 'Cannot create game, check your Input format'
  end
end