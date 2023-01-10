require_relative 'item'

class Book < Item
  def initialize(name, publisher, cover_state, published_date)
    super(name, published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  attr_reader :publisher, :cover_state

  def can_be_archived?
    if @cover_state == 'bad'
      true
    else
      super
    end
  end
end
