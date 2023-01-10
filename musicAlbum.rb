require './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(name, published_date, on_spotify: false)
    super(name, published_date)
    @on_spotify = on_spotify
  end


  def can_be_archived?
    if @on_spotify == true
      true
    else
      false
    end
  end
end