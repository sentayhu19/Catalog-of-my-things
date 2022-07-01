require_relative '../classes/music_album'

describe MusicAlbum do
  context 'Music Album ' do
    music_album = MusicAlbum.new('2002/12/12', true)
    it 'on the spotify return true' do
      expect(music_album.on_spotify).to equal(true)
    end

    it 'Published Date' do
      expect(music_album.publish_date).to eq Date.parse('2002/12/12')
    end

    it 'can be archived' do
      expect(music_album.archived).to eq(false)
    end
  end
end
