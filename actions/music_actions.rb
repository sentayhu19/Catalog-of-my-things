require_relative '../catalog_classes/music_album'
require_relative '../catalog_classes/genre'
require 'json'

class MusicActions
  attr_accessor :musics, :genres

  def initialize
    @musics = load_musics
    @genres = load_genres
  end

  def add_a_music
    print 'Author: '
    author = gets.chomp
    puts 'Publish date (yyyy-mm-dd): '
    publish_date = gets.chomp

    puts 'Is it archived? [Y/N]: '
    archived = gets.chomp.downcase

    puts 'Is it on spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase

    music = MusicAlbum.new(author, source, label, publish_date, archived, on_spotify)
    @musics.push(music)

    puts 'what is the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)

    genre.add_item(music)
    @genres.push(music.genre)
    puts "\nMusicAlbum added successfully.\n"
  end

  def list_musics
    if @musics.empty?
      puts 'No music available yet!'
    else
      @musics.each do |music|
        puts "
              Music id: #{music.id}
              Archived: #{music.archived == 'y' ? 'Yes' : 'No'}
              On spotify : #{music.on_spotify}
              Published on : #{music.publish_date}
              "
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'no genres available!'
    else
      @genres.each do |genre|
        puts "
              genre's id: #{genre.id}
              genre's name: #{genre.name}
            "
      end
    end
  end

  def load_musics
    data = []
    file = './data_JSON/musics.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |music|
        data.push(MusicAlbum.new(music['publish_date'], music['archived'], music['on_spotify']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def load_genres
    data = []
    file = './data_JSON/genres.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |genre|
        data.push(Genre.new(genre['name']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def save_musics
    data = []
    @musics.each do |music|
      data.push({ id: music.id,
                  archived: music.archived,
                  on_spotify: music.on_spotify,
                  publish_date: music.publish_date })
    end
    File.write('./data_JSON/musics.json', JSON.pretty_generate(data))
  end

  def save_genres
    data = []
    @genres.each do |genre|
      data.push({ id: genre.id, name: genre.name })
    end
    File.write('./data_JSON/genres.json', JSON.pretty_generate(data))
  end
end
