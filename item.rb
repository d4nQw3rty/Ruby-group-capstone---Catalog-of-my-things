require 'date'
class Item
  def initialize(name, published_date, id: Random.rand(1..1000), archived: false)
    @name = name
    @id = id
    @published_date = published_date
    @archived = archived
    @author = nil
  end

  def can_be_archived?
    difference = Date.today - DateTime.parse(@published_date)
    difference.to_i > 3652
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author(author)
    author.items.push(self) unless author.items.include?(self)
  end
end
