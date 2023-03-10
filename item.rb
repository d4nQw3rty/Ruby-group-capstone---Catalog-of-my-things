require 'date'
class Item
  def initialize(name, published_date, id: Random.rand(1..1000), archived: false)
    @name = name
    @id = id
    @published_date = published_date
    @archived = archived
    @author = nil
    @label = nil
    @genre = nil
  end

  attr_reader :id, :name, :published_date, :archived

  attr_accessor :label, :genre, :author

  def can_be_archived?
    difference = Date.today - DateTime.parse(@published_date)
    difference.to_i > 3652
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author(author)
    @author = author
    return if author.nil?

    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    return if label.nil?

    label.items.push(self) unless label.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    return if genre.nil?

    genre.items.push(self) unless genre.items.include?(self)
  end
end
