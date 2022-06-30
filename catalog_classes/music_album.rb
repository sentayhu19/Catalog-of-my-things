require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived
  attr_reader :publish_date, :id

  def initialize(_author, _source, _label, publish_date, on_spotify)
    super(publish_date: publish_date, archived: archived)
    @id = Random.rand(1..1000)
    @archived = archived
    @on_spotify = on_spotify
    @publish_date = Date.new
  end

  def can_be_archived?
    super && @on_spotify
  end
end
