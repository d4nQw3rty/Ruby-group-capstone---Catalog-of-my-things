require 'date'

class Item
  def initialize(name, published_date, id: Random.rand(1..1000), archived: false)
    @name = name
    @id = id
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    puts difference = Date.today - DateTime.parse(@published_date)
    puts difference.to_i >= 3652
  end

  def move_to_archive
    if can_be_archived? 
      @archived = true
    end
  end
end

item = Item.new('name', '12-01-2013')

puts item.can_be_archived?