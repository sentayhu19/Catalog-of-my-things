class MusicAlbum
  attr_accessor :on_spotify

  def initialize(on_spotify)
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
