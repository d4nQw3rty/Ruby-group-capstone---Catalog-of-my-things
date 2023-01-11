require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(name, published_date, on_spotify: false, id: Random.rand(1..1000), archived: false)
    super(name, published_date, id: id, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @on_spotify == true && super == true
  end
end
