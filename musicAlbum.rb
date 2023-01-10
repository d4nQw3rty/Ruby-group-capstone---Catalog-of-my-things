require './item'

class MusicAlbum < Item
  def initialize(on_spotify: true)
    super(on_spotify)
    @on_spotify = on_spotify
  end

  attr_reader :on_spotify

  def can_be_archived?
    if @on_spotify == true
      true
    else
      false
    end
  end
end