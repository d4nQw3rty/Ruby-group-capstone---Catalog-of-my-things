class Genre 
  attr_reader :name, :id, :items
  def initialize(name, id: Random.rand(1..1000))
    @name = name
    @id = id
    @item = []
  end
end