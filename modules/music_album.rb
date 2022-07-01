require 'json'
require_relative '../classes/music_album'

module MusicAlbumsModule
  def add_music_album(music_album)
    music_album_db = './json/music_album.json'
    music_albums = []
    new_music_album = {
      'publish_date' => music_album.publish_date,
      'on_spotify' => music_album.on_spotify
    }

    music_albums = JSON.parse(File.read(music_album_db)) if File.exist?(music_album_db)

    music_albums << new_music_album
    File.write(music_album_db, JSON.pretty_generate(music_albums))
  end

  def fetch_music_albums
    music_album_db = './json/music_album.json'
    music_albums = []

    if File.exist?(music_album_db)
      if File.empty?(music_album_db)
        music_albums
      else
        JSON.parse(File.read(music_album_db))
      end
    else
      music_albums
    end
  end

  def list_all_music_albums
    music_albums = fetch_music_albums

    if music_albums.empty?
      puts 'No Music Album to be displayed'
    else
      music_albums.each do |album|
        puts "Album's published date : #{album['publish_date']}"
        puts "The album is #{album['on_spotify'] ? '' : 'not'} on spotify"
      end
      menu_list
    end
  end

  def create_music_album
    print 'Enter Date Published format[yyyy-mm-dd]: '
    publish_date = gets.chomp

    print 'Do you want it to be on spotify?(y/n): '
    on_spotify = gets.chomp
    on_spotify = on_spotify.casecmp?('y')

    music_album = MusicAlbum.new(publish_date, on_spotify)

    add_music_album(music_album)
    puts 'Music Album Added successfully'
    menu_list
  rescue StandardError
    puts 'Cannot add music album, check your Input format'
    menu_list
  end
end