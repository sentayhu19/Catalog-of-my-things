require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    if (@archived = true && @on_spotify = true)
      true
    else
      false
    end
  end
end
