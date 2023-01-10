require './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(name, published_date, on_spotify: false)
    super(name, published_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    if @on_spotify == true && super == true
      true
    else
      false
    end
  end
end
# album = MusicAlbum.new('name', '2000-01-01', on_spotify: true)
# puts album.can_be_archived?
