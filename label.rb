class Label
  def initialize(title, color, id: Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  attr_reader :id, :title, :color, :items

  def add_item(item)
    @items.push(item)
    item.add_label(self)
  end
end
