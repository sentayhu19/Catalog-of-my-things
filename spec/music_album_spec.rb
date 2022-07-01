require_relative '../catalog_classes/music_album'
require_relative '../catalog_classes/item'

describe MusicAlbum do
  context 'when testing MusicAlbum class' do
    let(:music) { MusicAlbum.new(true, true) }

    it 'should check if instance of MusicAlbum is type of Item' do
      expect(music).to be_an_instance of MusicAlbum
    end

    it 'should check if it is an instance of MusicAlbum' do
      expect(on_spotify).to be_instance_of MusicAlbum
    end

    it 'should return true' do
      expect(music.on_spotify).to be true
    end

    it 'should return false' do
      expect(music.archived).to be true
    end

    it 'should check can_be_archived? method' do
      @music_album.on_spotify = true
      @music_album.publish_date = '2004-11-12'
      @music_album.move_to_archive
      expect(@music_album.archived).to eq true
    end
  end
end
