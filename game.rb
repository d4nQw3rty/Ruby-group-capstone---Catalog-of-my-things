require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_date

  def initialize(name, published_date, multiplayer, last_played_date, id: Random.rand(1..1000), archived: false)
    super(name, published_date, id: id, archived: archived)
    @last_played_date = last_played_date
    @multiplayer = multiplayer
  end

  def can_be_archived?
    Date.today - DateTime.parse(@published_date) > 3652 && Date.today - DateTime.parse(@last_played_date) > 365 * 2
  end
end
