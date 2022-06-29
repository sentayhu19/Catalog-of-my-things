require_relative '../catalog_classes/music_album'
require_relative '../catalog_classes/item'

describe MusicAlbum do
    context "when testing MusicAlbum class" do
        before(:each) do
            @music_album = MusicAlbum.new('2020-08-16', true, true)
        end

        it "should check if instance of MusicAlbum is type of Item" do
            expect(@music_album.instance_of?(MusicAlbum)).to_not be true
        end

        it "should check if it is an instance of MusicAlbum" do
            expect(@on_spotify).to be_instance_of MusicAlbum
        end

        it "should check can_be_archived? method" do
            @music_album.on_spotify = true
            @music_album.publish_date = '2004-11-12'
            @music_album.move_to_archive
            expect(@music_album.archived).to eq true
        end
    end
end