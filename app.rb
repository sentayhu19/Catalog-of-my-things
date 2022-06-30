class App
  attr_reader :genres, :authors, :labels, :books, :musics, :games

  def create_music(music)
    @musics << music
  end

  def add_genre(item)
    @genres.add_item(item)
  end

  def list_genres
    @genres.each_with_index do |genre, index|
      puts "#{index}. ID: #{genre.id} Name: #{genre.name}"
    end
  end
end
