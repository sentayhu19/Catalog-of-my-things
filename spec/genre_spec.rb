require 'date'
require_relative '../classes/music_album'
require_relative '../classes/genre'

describe Genre do
  context 'Given an ' do
    music_album = MusicAlbum.new('2002/12/12', true)
    genre = Genre.new('rock')

    it 'check the name of the genre empty or not' do
      expect(genre.name).to_not be_empty
    end

    it 'add new item' do
      genre.add_item(music_album)
      expect(genre.items[0]).to eq music_album
    end

    it 'should check the genre name' do
      expect(genre.name).to eq('rock')
    end
  end
end
