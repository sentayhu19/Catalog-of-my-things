require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived
  attr_reader :publish_date, :id

  def initialize(publish_date, archived, on_spotify)
    super(publish_date)
    @id = Random.rand(1..1000)
    @archived = archived
    @on_spotify = on_spotify
    @publish_date = publish_date
  end

  def can_be_archived?
    super && @on_spotify
  end
end
