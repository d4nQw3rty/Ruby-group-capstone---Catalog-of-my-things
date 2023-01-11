class Genre
  def initialize(name, id: Random.rand(1..1000))
    @name = name
    @id = id
    @items = []
  end

  attr_reader :name, :id, :items

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
