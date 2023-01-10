require_relative 'item'

class Book < Item
  # rubocop:disable Metrics/ParameterLists
  def initialize(name, publisher, cover_state, published_date, id: Random.rand(1..1000), archived: false)
    # rubocop:enable Metrics/ParameterLists
    super(name, published_date, id: id, archived: archived)
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
